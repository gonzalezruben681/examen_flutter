import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final int id;
  final String name;
  final String lastName;
  final int? birthday;

  const EmployeeEntity({
    required this.id,
    required this.name,
    required this.lastName,
    required this.birthday,
  });

  @override
  List<Object?> get props => [id, name, lastName, birthday];

  String getFormattedBirthday() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(birthday!);
    return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
  }
}
