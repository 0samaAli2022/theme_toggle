import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: ThemeData.light()
      .appBarTheme
      .copyWith(foregroundColor: Colors.black87, color: Colors.white70),
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade400,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: ThemeData.dark()
      .appBarTheme
      .copyWith(foregroundColor: Colors.white70, color: Colors.black87),
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
);
