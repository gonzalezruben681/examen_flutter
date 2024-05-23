import 'package:dio/dio.dart';
import 'package:examen_flutter/data/data_source/employee_datasource_impl.dart';
import 'package:examen_flutter/data/models/employee_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late EmployeeDatasourceImpl datasource;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    datasource =
        EmployeeDatasourceImpl(dio: mockDioClient); // Inyecta el mock de Dio
  });

  const tName = 'John Doe';
  final tEmployeesJson = [
    {
      'id': 1,
      'name': 'Aguayo González',
      'last_name': 'Jaime Francisco',
      'birthday': 1587599581347
    },
    {
      'id': 2,
      'name': 'Doe',
      'last_name': 'Jane',
      'birthday': 1587599581348,
    }
  ];

  final tEmployees =
      tEmployeesJson.map((json) => EmployeeModel.fromJson(json)).toList();

  group('Obtener los empleados', () {
    test(
        'debería devolver la lista de EmployeeModel cuando el código de respuesta sea 200',
        () async {
      // Configura el mock para responder con datos simulados
      when(mockDioClient.get(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/examen/employees/$tName'),
          data: {
            'data': {'employees': tEmployeesJson}
          },
          statusCode: 200,
        ),
      );

      // Llama al método del datasource
      final result = await datasource.getEmployees(tName);

      // Comprueba el resultado
      expect(result, tEmployees);
    });

    test(
        'debería lanzar una excepción cuando el código de respuesta no sea 200',
        () async {
      // Configura el mock para responder con un error
      when(mockDioClient.get(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/examen/employees/$tName'),
          statusCode: 404,
        ),
      );

      // Verifica que el método arroje una excepción
      expect(() async => await datasource.getEmployees(tName), throwsException);
    });

    test(
        'debería lanzar una excepción cuando hay un error al conectarse al servidor',
        () async {
      // Configura el mock para lanzar un error
      when(mockDioClient.get(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/examen/employees/$tName'),
      ));

      // Verifica que el método arroje una excepción
      expect(() async => await datasource.getEmployees(tName), throwsException);
    });
  });
}
