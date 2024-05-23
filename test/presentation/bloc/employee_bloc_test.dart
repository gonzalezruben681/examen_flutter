import 'package:bloc_test/bloc_test.dart';
import 'package:examen_flutter/domain/entities/employee_entity.dart';
import 'package:examen_flutter/presentation/blocs/employee/employee_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late MockEmployeeUsecase mockEmployeeUsecase;
  late EmployeeBloc employeeBloc;

  setUp(() {
    mockEmployeeUsecase = MockEmployeeUsecase();
    employeeBloc = EmployeeBloc(employeeUsecase: mockEmployeeUsecase);
  });

  tearDown(() {
    employeeBloc.close();
  });

  const tEmpleyeeDetail = [
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

  const tEmployeeName = 'Andrea';

  test('el estado inicial es EmployeeInitial', () {
    expect(employeeBloc.state, EmployeeInitial());
  });

  blocTest<EmployeeBloc, EmployeeState>(
    'debe emitir [cargando, datos empleados] cuando los datos se obtienen correctamente',
    build: () {
      when(mockEmployeeUsecase.getEmployees(tEmployeeName))
          .thenAnswer((_) async => tEmpleyeeDetail);
      return employeeBloc;
    },
    act: (bloc) => bloc.add(const GetEmployees(tEmployeeName)),
    expect: () => [
      EmployeeLoading(),
      const EmployeeLoaded(employees: tEmpleyeeDetail),
    ],
  );
  blocTest<EmployeeBloc, EmployeeState>(
    'debe emitir [cargando, error] cuando la obtención de datos no se realiza correctamente',
    build: () {
      when(mockEmployeeUsecase.getEmployees(tEmployeeName))
          .thenThrow((_) async => Exception());
      return employeeBloc;
    },
    act: (bloc) => bloc.add(const GetEmployees(tEmployeeName)),
    expect: () => [
      EmployeeLoading(),
      EmployeeError(),
    ],
  );
}
