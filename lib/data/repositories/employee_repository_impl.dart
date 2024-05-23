import 'package:examen_flutter/domain/datasources/employee_datasource.dart';
import 'package:examen_flutter/domain/entities/employee_entity.dart';
import 'package:examen_flutter/domain/repositories/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeDatasource dataSource;

  EmployeeRepositoryImpl({required this.dataSource});

  @override
  Future<List<EmployeeEntity>> getEmployees(String name) async {
    final employeeModels = await dataSource.getEmployees(name);
    return employeeModels.map((model) => model.toEntity()).toList();
  }
}
