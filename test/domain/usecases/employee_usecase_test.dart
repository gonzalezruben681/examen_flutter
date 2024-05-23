import 'package:examen_flutter/domain/entities/employee_entity.dart';
import 'package:examen_flutter/domain/usecases/employee_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late EmployeeUsecase employeeUsecase;
  late MockEmployeeRepository mockEmployeeRepository;

  setUp(() {
    mockEmployeeRepository = MockEmployeeRepository();
    employeeUsecase =
        EmployeeUsecase(employeeRepository: mockEmployeeRepository);
  });

  const testEmpleyeeDetail = [
    EmployeeEntity(
        id: 1,
        name: "Aguayo González",
        lastName: "Jaime Francisco",
        birthday: 1587599581347),
    EmployeeEntity(
        id: 2,
        name: "Chávez Heredia",
        lastName: "Andrea",
        birthday: 1587599581347)
  ];

  const testEmployeeName = 'Andrea';

  test('debería obtener una lista de empleados del repositorio', () async {
    // Configura el mock para responder con una lista de empleados
    when(mockEmployeeRepository.getEmployees(testEmployeeName))
        .thenAnswer((_) async => testEmpleyeeDetail);

    // Llama al método del caso de uso
    final result = await employeeUsecase.getEmployees(testEmployeeName);

    // Verifica que el método del repositorio haya sido llamado con el parámetro correcto
    verify(mockEmployeeRepository.getEmployees(testEmployeeName));

    // Comprueba el resultado
    expect(result, testEmpleyeeDetail);
  });
}
