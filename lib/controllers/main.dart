import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/Global/provider/treinoProvider.dart';
import 'package:teste/Global/routes/app_routes.dart';
import 'package:teste/view/recursos/login/cadatroUsuario.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';
import 'package:teste/view/recursos/login/login_page.dart';
import 'package:teste/view/recursos/splash_page.dart';
import '../Global/treino_1.0/treino_form.dart';
import '../view/recursos/thema/theme.dart';
import 'dart:io';
// import 'package:teste/view/splash_page.dart';
// import 'package:teste/view/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp;
  runApp(ValueListenableBuilder(
      valueListenable: tema,
      builder: ((context, value, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              // retornar o changeNotifier que irá retornar a classe que tem changeNotifier
              create: (context) => TreinosProvider(),
            )
          ],
          child: MaterialApp(
            themeMode: tema.value,
            theme: temaLight(),
            darkTheme: temaDark(),
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
            initialRoute: '/splash',
            routes: {
              '/splash': (_) => const SplashScreen(),
              '/login': (_) => LoginPage(),
              '/home': (_) => HomePage(),
              '/cadastrar': (_) => CadastroUser(),
              AppRoutes.TREINO_FORM: (_) => TreinoForm(),
            },
          ),
        );
      })));
}
