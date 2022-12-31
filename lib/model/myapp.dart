
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/view/recursos/cadatroUsuario.dart';
import 'package:teste/view/recursos/homeScreen.dart';
import 'package:teste/view/recursos/login_page.dart';
import 'package:teste/view/splash_page.dart';
import 'package:teste/view/theme.dart';

// final tema = ValueNotifier(ThemeMode.light);

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: tema,
        builder: ((context, value, child) {
          return MaterialApp(
            title: 'Treine+',
            themeMode: tema.value,
            theme: temaLight(),
            darkTheme: temaDark(),
            home: const HomeScreen(),
            debugShowCheckedModeBanner: false,
            initialRoute: '/splash',
            routes: {
              '/splash': (_) => const SplashScreen(),
              '/login': (_) => LoginPage(),
              '/home': (_) => HomeScreen(),
              '/cadastrar': (_) => CadastroUser()
            },
          );
        }));
  }

  
}
