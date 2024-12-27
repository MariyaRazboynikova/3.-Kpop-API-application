import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 185, 210, 255),
    primary: Color.fromARGB(255, 27, 70, 88),
    secondary: Color.fromARGB(255, 255, 255, 255),
    tertiary: Color.fromARGB(255, 19, 23, 83),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 27, 70, 88),
    primary: Color.fromARGB(255, 185, 210, 255),
    secondary: Color.fromARGB(255, 0, 0, 0),
    tertiary: Color.fromARGB(255, 255, 255, 255),
  ),
);
