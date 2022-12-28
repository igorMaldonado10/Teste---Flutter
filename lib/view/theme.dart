import 'package:flutter/material.dart';

ThemeData temaLight() {
  final ThemeData temaLight = ThemeData();
  return temaLight.copyWith(
      colorScheme: temaLight.colorScheme.copyWith(
        brightness: Brightness.light,
        primary: Color.fromRGBO(211, 111, 47, 100),
        secondary: Color.fromRGBO(186, 188, 190, 100),
      ),
      scaffoldBackgroundColor: Colors.white,
      cardColor: Color.fromRGBO(187, 170, 187, 100),
      bottomAppBarColor: Color.fromRGBO(211, 111, 47, 100));
}

mixin BgGradient {
  static Container GradBg = Container(
     decoration: BoxDecoration(gradient: 
                  LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors:[ 
                      Color.fromRGBO(211, 111, 47, 100),
                    Colors.white]
                    )
                  ),
  );
}
