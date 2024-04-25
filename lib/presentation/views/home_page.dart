import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/home_cubit.dart';
import 'detail_page.dart';
part 'widgets/home/check_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Inicio'),
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, List<String>>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _buildCheckboxOption(context, 'Cámara'),
                    _buildCheckboxOption(context, 'Lista de empleados'),
                    _buildCheckboxOption(context, 'Nombre completo'),
                    _buildCheckboxOption(context, 'Número telefónico'),
                    _buildCheckboxOption(context, 'Fecha de nacimiento'),
                    _buildCheckboxOption(context, 'Sexo'),
                    _buildCheckboxOption(context, 'Color Favorito'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _navigateToNextScreen(context, state);
                },
                child: const Text('Siguiente'),
              ),
              const SizedBox(height: 10)
            ],
          ),
        );
      },
    );
  }

  void _navigateToNextScreen(
      BuildContext context, List<String> selectedOptions) {
    if (selectedOptions.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(selectedOptions: selectedOptions),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
          content: const Text('Debes seleccionar una opción.'),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Aceptar'),
              ),
            ),
          ],
        ),
      );
    }
  }
}
