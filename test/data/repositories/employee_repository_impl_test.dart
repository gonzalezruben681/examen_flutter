import 'package:examen_flutter/data/models/employee_model.dart';
import 'package:examen_flutter/domain/entities/employee_entity.dart'; // Asegúrate de importar el modelo correcto

import 'package:examen_flutter/data/repositories/employee_repository_impl.dart'; // Asegúrate de importar la implementación correcta
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mocks/test_helper.mocks.dart';
// Importa el archivo generado de mocks

void main() {
  late EmployeeRepositoryImpl repository;
  late MockEmployeeDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockEmployeeDatasource();
    repository = EmployeeRepositoryImpl(dataSource: mockDatasource);
  });

  const tName = 'John Doe';
  final tEmployeesModel = [
    const EmployeeModel(
      id: 1,
      name: 'Aguayo González',
      lastName: 'Jaime Francisco',
      birthday: 1587599581347,
    ),
    const EmployeeModel(
      id: 2,
      name: 'Doe',
      lastName: 'Jane',
      birthday: 1587599581348,
    ),
  ];
  final tEmployees = tEmployeesModel
      .map((model) => EmployeeEntity(
            id: model.id,
            name: model.name,
            lastName: model.lastName,
            birthday: model.birthday,
          ))
      .toList();

  test(
      'debería devolver la lista de EmployeeEntity cuando la llamada a la fuente de datos sea exitosa',
      () async {
    // Configura el mock para responder con una lista de EmployeeModel
    when(mockDatasource.getEmployees(any))
        .thenAnswer((_) async => tEmployeesModel);

    // Llama al método del repository
    final result = await repository.getEmployees(tName);

    // Verifica que el método del datasource haya sido llamado con el parámetro correcto
    verify(mockDatasource.getEmployees(tName));

    // Comprueba el resultado
    expect(result, tEmployees);
  });

  test(
      'debería generar una excepción cuando la llamada a la fuente de datos no tiene éxito',
      () async {
    // Configura el mock para lanzar una excepción
    when(mockDatasource.getEmployees(any)).thenThrow(Exception('Server Error'));

    // Verifica que el método arroje una excepción
    expect(() async => await repository.getEmployees(tName), throwsException);
  });
}
