part of 'employee_bloc.dart';

sealed class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class GetEmployees extends EmployeeEvent {
  final String name;

  const GetEmployees(this.name);
}
