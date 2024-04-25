part of '../../detail_page.dart';



  Widget _empleadosListWidget(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        if (state is EmployeeLoaded) {
          return ListView.builder(
            itemCount: state.employees.length,
            itemBuilder: (context, index) {
              final employee = state.employees[index];
              return ListTile(
                title: Text('Empleado ${index + 1}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nombre: ${employee.name}'),
                    Text('Cumpleaños: ${employee.getFormattedBirthday()}'),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _nombreCompletoTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Nombre completo',
        ),
        maxLength: 35,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'^[a-zA-Z]+$'),
          ),
          LengthLimitingTextInputFormatter(35),
        ],
      ),
    );
  }

  Widget _numeroTelTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Número telefónico',
        ),
        keyboardType: TextInputType.phone,
        maxLength: 10,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'^[0-9]*$'),
          ),
          LengthLimitingTextInputFormatter(10),
        ],
      ),
    );
  }