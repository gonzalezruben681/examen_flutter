part of 'employee_bloc.dart';

sealed class EmployeeState extends Equatable {
  const EmployeeState();
  
  @override
  List<Object> get props => [];
}

final class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<EmployeeEntity> employees;

  const EmployeeLoaded({required this.employees});
}

class EmployeeError extends EmployeeState {}
