import 'package:flutter/material.dart';

ThemeData tema() {
  final ThemeData tema = ThemeData();
  return tema.copyWith(
    colorScheme: tema.colorScheme.copyWith(
      brightness: Brightness.light,
      background: Color.fromRGBO(47, 84, 115, 100),
      primary: Color.fromRGBO(211, 111, 47, 100),
      secondary: Color.fromRGBO(47, 84, 115, 100)
    )
    
  );
}
