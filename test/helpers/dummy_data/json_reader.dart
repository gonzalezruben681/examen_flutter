import 'dart:io'; // Importa la biblioteca dart:io para trabajar con archivos

String readJson(String name) {
  // Función para leer un archivo JSON
  // Obtiene la ruta del directorio actual
  var dir = Directory.current.path;

  // Si la ruta del directorio termina en '/test', elimina la parte '/test'
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }

  // Construye la ruta completa del archivo JSON
  String filePath = '$dir/test/$name';

  // Lee el contenido del archivo JSON como una cadena de texto
  String fileContent = File(filePath).readAsStringSync();

  // Devuelve el contenido del archivo JSON
  return fileContent;
}
