import 'package:dio/dio.dart';
import 'package:examen_flutter/domain/datasources/employee_datasource.dart';
import 'package:examen_flutter/domain/repositories/employee_repository.dart';
import 'package:examen_flutter/domain/usecases/employee_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    EmployeeRepository,
    EmployeeUsecase,
    EmployeeDatasource
  ],
  customMocks: [
    MockSpec<Dio>(as: #MockDioClient)
  ] 
)

void main() {}