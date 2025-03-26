import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
  buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),
);
