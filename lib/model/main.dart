import 'package:flutter/material.dart';
import 'package:teste/view/recursos/cadatroUsuario.dart';
import 'package:teste/view/recursos/homeScreen.dart';
import 'package:teste/view/recursos/login_page.dart';
import 'package:teste/view/splash_page.dart';
import 'package:teste/view/theme.dart';

void main() {
  runApp(MaterialApp(
    title: 'Treine+',
    theme: temaLight(),
    home: const HomeScreen(),
    debugShowCheckedModeBanner: false,
    initialRoute: '/splash',
    routes: {
      '/splash': (_) => const SplashScreen(),
      '/login': (_) => LoginPage(),
      '/home': (_) => HomeScreen(),
      '/cadastrar':(_) => CadastroUser()
    },
  ));
}