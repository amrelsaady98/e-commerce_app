import 'package:flutter/material.dart';

class AppColors {
  static const Color red = Color.fromRGBO(235, 87, 87, 1);
  static const Color success = Color.fromRGBO(39, 174, 96, 1);
  static const Color yellow = Color.fromRGBO(242, 201, 76, 1);
  static const Color secondaryText = Color.fromRGBO(128, 128, 128, 1);
  static const Color primaryText = Color.fromRGBO(36, 36, 36, 1);

  static const appColorsLight = ColorScheme.light(
    primary: Color.fromRGBO(36, 36, 36, 1),
    secondary: Color.fromRGBO(128, 128, 128, 1),
    primaryContainer: Color.fromRGBO(255, 255, 255, 1),
    secondaryContainer: Color.fromRGBO(240, 240, 240, 1),
    onPrimaryContainer: Colors.black,
    onSecondaryContainer: Colors.black,
  );
}
