import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:examen_flutter/domain/entities/employee_entity.dart';
import 'package:examen_flutter/domain/repositories/employee_repository.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository repository;
  EmployeeBloc({required this.repository}) : super(EmployeeInitial()) {
    on<GetEmployees>(_getEmployees);
  }
  Future<void> _getEmployees(
      GetEmployees event, Emitter<EmployeeState> emit) async {
    try {
      final List<EmployeeEntity> employees =
          await repository.getEmployees(event.name);
      emit(EmployeeLoaded(employees: employees));
    } catch (e) {
      emit(EmployeeError());
    }
  }
}
