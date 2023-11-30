import 'package:flutter_test/flutter_test.dart';
import 'package:fakemon2/Modelo/RegistroJugador.dart';

void main() {
  group('RegistroJugador', () {
    test('nombre debe ser actualizado', () {
      final nuevoNombre = 'Nuevo Nombre';
      RegistroJugador.nombre = nuevoNombre;
      expect(RegistroJugador.nombre, equals(nuevoNombre));
    });

    test('profesion debe ser actualizada', () {
      final nuevaProfesion = 'Desarrollador';
      RegistroJugador.profesion = nuevaProfesion;
      expect(RegistroJugador.profesion, equals(nuevaProfesion));
    });

    test('selectedGenero debe ser actualizado', () {
      final nuevoSelectedGenero = <bool>[false, true];
      RegistroJugador.selectedGenero = nuevoSelectedGenero;
      expect(RegistroJugador.selectedGenero, equals(nuevoSelectedGenero));
    });
  });
}
