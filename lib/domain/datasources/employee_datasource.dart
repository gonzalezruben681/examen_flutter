import 'package:examen_flutter/data/models/employee_model.dart';

abstract class EmployeeDatasource {
  Future<List<EmployeeModel>> getEmployees(String name);
}