import 'dart:convert';

import 'package:examen_flutter/data/models/employee_model.dart';
import 'package:examen_flutter/domain/entities/employee_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/dummy_data/json_reader.dart';

void main() {
  const testEmployeeModel = EmployeeModel(
      id: 1,
      name: "Aguayo González",
      lastName: "Jaime Francisco",
      birthday: 1587599581347);

  test('debería ser una subclase de entidad empleado', () async {
    expect(testEmployeeModel, isA<EmployeeEntity>());
  });

  test('debería devolver un modelo válido de json', () async {
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_employee_response.json'),
    );

    final result = EmployeeModel.fromJson(jsonMap);

    expect(result, equals(testEmployeeModel));
  });
}
