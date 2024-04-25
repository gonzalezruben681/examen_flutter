import 'package:examen_flutter/domain/entities/employee_entity.dart';

abstract class EmployeeDatasource {
  Future<List<EmployeeEntity>> getEmployees(String name);
}