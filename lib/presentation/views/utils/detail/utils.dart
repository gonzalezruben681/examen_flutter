part of '../../detail_page.dart';

String _getAppBarTitle(selectedOptions) {
  for (var option in selectedOptions) {
    switch (option) {
      case 'Cámara':
        return 'Cámara';
      case 'Lista de empleados':
        return 'Lista de empleados';
      case 'Nombre completo':
        return 'Nombre completo';
      case 'Número telefónico':
        return 'Número telefónico';
      case 'Fecha de nacimiento':
        return 'Fecha de nacimiento';
      case 'Sexo':
        return 'Sexo';
      case 'Color Favorito':
        return 'Color Favorito';
      default:
        return 'Opción Desconocida';
    }
  }
  return 'Opción Desconocida';
}
