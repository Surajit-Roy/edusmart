import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
  buttonTheme: const ButtonThemeData(buttonColor: Colors.deepPurple),
);
