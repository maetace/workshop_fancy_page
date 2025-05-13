import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.brown,
    brightness: Brightness.light,
  ),
);

ThemeData get darkTheme => ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.brown,
    brightness: Brightness.dark,
  ),
);
