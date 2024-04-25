import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examen_flutter/presentation/blocs/employee/employee_bloc.dart';

part 'utils/detail/utils.dart';
part 'widgets/detail/widgets.dart';

class SecondPage extends StatefulWidget {
  final List<String> selectedOptions;

  const SecondPage({super.key, required this.selectedOptions});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController dateController = TextEditingController();
  late DateTime selectedDate;
  String? _selectedGender;
  String? _selectedColor;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle(widget.selectedOptions)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final employeeBloc = BlocProvider.of<EmployeeBloc>(context);
    switch (widget.selectedOptions.first) {
      case 'Cámara':
        return _buildCameraWidget();
      case 'Lista de empleados':
        employeeBloc.add(const GetEmployees('ruben'));
        return _empleadosListWidget(context);
      case 'Nombre completo':
        return _nombreCompletoTextField();
      case 'Número telefónico':
        return _numeroTelTextField();
      case 'Fecha de nacimiento':
        return _fechadeNacimientoTextField();
      case 'Sexo':
        return _generoRadio();
      case 'Color Favorito':
        return _favoriteColorDropDown();
      default:
        return const Center(child: Text('Opción Desconocida'));
    }
  }

  Widget _buildCameraWidget() {
    //TODO: Implementa la lógica para la cámara aquí
    return const Center(child: Text('Widget de Cámara'));
  }

  Widget _fechadeNacimientoTextField() {
    DateTime selectedDate = DateTime.now();

    Future selectDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      );
      if (picked != null) {
        setState(() {
          selectedDate = picked;
        });
        dateController.text = DateFormat("dd-MM-yyyy").format(picked);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: TextField(
        controller: dateController,
        readOnly: true,
        onTap: selectDate,
        decoration: const InputDecoration(
          label: Text('Fecha de nacimiento'),
          suffixIcon: Icon(Icons.calendar_today),
        ),
      ),
    );
  }

  Widget _generoRadio() {
    return Column(
      children: [
        RadioListTile<String>(
          title: const Text('Masculino'),
          value: 'Masculino',
          groupValue: _selectedGender,
          onChanged: (value) {
            setState(() {
              _selectedGender = value;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Femenino'),
          value: 'Femenino',
          groupValue: _selectedGender,
          onChanged: (value) {
            setState(() {
              _selectedGender = value;
            });
          },
        ),
      ],
    );
  }

  Widget _favoriteColorDropDown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'Color Favorito',
        ),
        value: _selectedColor,
        onChanged: (newValue) {
          setState(() {
            _selectedColor = newValue;
          });
        },
        items: const [
          DropdownMenuItem(
            value: 'Verde',
            child: Text('Verde'),
          ),
          DropdownMenuItem(
            value: 'Rojo',
            child: Text('Rojo'),
          ),
          DropdownMenuItem(
            value: 'Azul',
            child: Text('Azul'),
          ),
          DropdownMenuItem(
            value: 'Morado',
            child: Text('Morado'),
          ),
          DropdownMenuItem(
            value: 'Naranja',
            child: Text('Naranja'),
          ),
        ],
      ),
    );
  }
}
