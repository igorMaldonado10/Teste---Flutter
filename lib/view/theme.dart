import 'package:flutter/material.dart';

ThemeData tema() {
  final ThemeData tema = ThemeData();
  return tema.copyWith(
      colorScheme: tema.colorScheme.copyWith(
          brightness: Brightness.light,
          primary: Color.fromRGBO(211, 111, 47, 100),
          secondary: Color.fromRGBO(47, 84, 115, 100)));
}

mixin AppColors {
  static Color darkBg = Color.fromRGBO(47, 84, 115, 100);
}
