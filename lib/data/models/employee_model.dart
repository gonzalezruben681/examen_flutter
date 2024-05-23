import 'package:examen_flutter/domain/entities/employee_entity.dart';

class EmployeeModel extends EmployeeEntity {
  const EmployeeModel({
    required super.id,
    required super.name,
    required super.lastName,
    required super.birthday,
  });
  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      id: json['id'],
      name: json['name'],
      lastName: json['last_name'],
      birthday: json['birthday']);

  EmployeeEntity toEntity() => EmployeeEntity(
        id: id,
        name: name,
        lastName: lastName,
        birthday: birthday,
      );
}
