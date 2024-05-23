import 'package:examen_flutter/domain/usecases/employee_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examen_flutter/domain/entities/employee_entity.dart';
import 'package:equatable/equatable.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeUsecase employeeUsecase;
  EmployeeBloc({required this.employeeUsecase}) : super(EmployeeInitial()) {
    on<GetEmployees>(_getEmployees);
  }
  Future<void> _getEmployees(
      GetEmployees event, Emitter<EmployeeState> emit) async {
    emit(EmployeeLoading());
    try {
      final List<EmployeeEntity> employees =
          await employeeUsecase.getEmployees(event.name);
      emit(EmployeeLoaded(employees: employees));
    } catch (e) {
      emit(EmployeeError());
    }
  }
}
