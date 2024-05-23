import 'package:examen_flutter/domain/usecases/employee_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examen_flutter/presentation/cubits/home_cubit.dart';
import 'package:examen_flutter/presentation/views/home_page.dart';
import 'package:examen_flutter/data/data_source/employee_datasource_impl.dart';
import 'package:examen_flutter/data/repositories/employee_repository_impl.dart';
import 'package:examen_flutter/presentation/blocs/employee/employee_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EmployeeBloc(
              employeeUsecase: EmployeeUsecase(
                  employeeRepository: EmployeeRepositoryImpl(
                      dataSource: EmployeeDatasourceImpl())),
            ),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mi Aplicación',
          home: HomePage(),
        ));
  }
}
