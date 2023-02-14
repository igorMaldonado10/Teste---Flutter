
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/Profile/perfil_service.dart';
import 'package:teste/view/recursos/barraInferior.dart';
import 'package:teste/view/recursos/login/cadatroUsuario.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';
import 'package:teste/view/recursos/login/login_page.dart';
import 'package:teste/view/recursos/splash_page.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';


Future main() async {
  runApp(
    ValueListenableBuilder(
      valueListenable: tema,
      builder: ((context, value, child) {
        return 
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => PerfilService()
              
              ),
            ChangeNotifierProvider(
              // retornar o changeNotifier que irá retornar a classe que tem changeNotifier
              create: (context) => TreinoService(),
            )
          ],
          child: 

           GetMaterialApp(
          /// GetMaterialApp = Configurações pré-prontas para a utilização do GetX
            themeMode: tema.value,

            // ThemeData light
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: lightColorScheme,
              useMaterial3: true,
              toggleableActiveColor: Color(0xFF85746B),
              backgroundColor: 
              Color(0xFF9B4501),
              primaryColorLight: Color.fromARGB(253, 245, 137, 50),
              shadowColor: Colors.grey.shade700
            ),

            // ThemeData dark
            darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: darkColorScheme,
            useMaterial3: true,
            backgroundColor: Color(0xFF9B4501),
            shadowColor: Colors.grey.shade700,
            primaryColorDark: Color.fromARGB(253, 245, 137, 50)
            
            ),
            home: const BottomNavBar(),
            //  const HomePage(),
            debugShowCheckedModeBanner: false,
            initialRoute: '/splash',
            routes: {
              '/splash': (_) => const SplashScreen(),
              '/login': (_) => LoginPage(),
              '/home': (_) => BottomNavBar(),

              '/cadastrar': (_) => CadastroUser(),
              // AppRoutes.TREINO_FORM: (_) => TreinoForm(),
            },
          )
        );
      })));
}
