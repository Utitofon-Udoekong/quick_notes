
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    onPrimary: Colors.grey.shade800,
    onSurface: Colors.grey.shade700
  ),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade800,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade900,
    onPrimary: Colors.grey.shade200,
    onSurface: Colors.grey.shade300
  ),
);