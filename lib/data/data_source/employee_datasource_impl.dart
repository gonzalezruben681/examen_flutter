import 'package:dio/dio.dart';
import 'package:examen_flutter/data/models/employee_model.dart';
import 'package:examen_flutter/domain/datasources/employee_datasource.dart';

class EmployeeDatasourceImpl implements EmployeeDatasource {
  final Dio dio;

  EmployeeDatasourceImpl({Dio? dio})
      : dio = dio ?? Dio(BaseOptions(
          baseUrl: 'https://6edeayi7ch.execute-api.us-east-1.amazonaws.com/v1'));

  @override
  Future<List<EmployeeModel>> getEmployees(String name) async {
    try {
      final response = await dio.get('/examen/employees/$name');
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data['data']['employees'];
        final employees =
            jsonList.map((json) => EmployeeModel.fromJson(json)).toList();
        return employees;
      } else {
        throw Exception('No se pudo recuperar a los empleados');
      }
    } catch (e) {
      throw Exception('Error al conectar con el servidor');
    }
  }
}
