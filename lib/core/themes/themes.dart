import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: Color.fromARGB(255, 137, 166, 216),
      primary: Color.fromARGB(255, 27, 70, 88),
      secondary: Color.fromARGB(255, 198, 36, 158),
      tertiary: Color.fromARGB(255, 47, 19, 83),
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: Color.fromARGB(255, 27, 70, 88),
      primary: Color.fromARGB(255, 137, 166, 216),
      secondary: Color.fromARGB(255, 47, 19, 83),
      tertiary: Color.fromARGB(255, 198, 36, 158),
    ));
