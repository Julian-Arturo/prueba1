import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class Responsive {
  late double _screenWidth, _screenHeight, _screenDiagonal;
  late bool _isSmallScreen;

  // Valores constantes para usar en los cálculos.
  static const double kTabletBreakpoint = 720.0;
  static const double kDesktopBreakpoint = 1440.0;

  // Obtener una instancia Responsive desde cualquier lugar de la aplicación.
  static Responsive? of(BuildContext context) {
    try {
      return Responsive._(context);
    } catch (e) {
      return null;
    }
  }

  Responsive._(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
    _screenDiagonal =
        math.sqrt(math.pow(_screenWidth, 2) + math.pow(_screenHeight, 2));
    _isSmallScreen = size.shortestSide >= kTabletBreakpoint;
  }

  // Ancho de pantalla multiplicado por un porcentaje.
  double width(double percent) => _screenWidth * percent / 100;

  // Altura de pantalla multiplicada por un porcentaje.
  double height(double percent) => _screenHeight * percent / 100;

  // Diagonal de pantalla multiplicada por un porcentaje.
  double diagonal(double percent) => _screenDiagonal * percent / 100;

  // Devuelve true si la pantalla es lo suficientemente pequeña como para ser considerada un teléfono.
  bool isPhone() => _isSmallScreen;
}
