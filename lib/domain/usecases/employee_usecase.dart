import 'package:examen_flutter/domain/entities/employee_entity.dart';
import 'package:examen_flutter/domain/repositories/employee_repository.dart';

class EmployeeUsecase {
  final EmployeeRepository employeeRepository;
  EmployeeUsecase({required this.employeeRepository});

  Future<List<EmployeeEntity>> getEmployees(String name) async {
    return employeeRepository.getEmployees(name);
  }
}
