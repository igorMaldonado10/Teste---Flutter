// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/view/recursos/barraInferior.dart';
// import 'package:provider/provider.dart';
// import 'package:teste/Global/provider/treinoProvider.dart';
// import 'package:teste/Global/routes/app_routes.dart';
import 'package:teste/view/recursos/login/cadatroUsuario.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';
import 'package:teste/view/recursos/login/login_page.dart';
import 'package:teste/view/recursos/splash_page.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';


Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp;
  runApp(ValueListenableBuilder(
      valueListenable: tema,
      builder: ((context, value, child) {
        return 
        // MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider(
        //       // retornar o changeNotifier que irá retornar a classe que tem changeNotifier
        //       create: (context) => TreinosProvider(),
        //     )
        //   ],
          // child: 

           GetMaterialApp(
          /// GetMaterialApp = Configurações pré-prontas para a utilização do GetX
            themeMode: tema.value,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: lightColorScheme,
              useMaterial3: true,
              toggleableActiveColor: Color(0xFF85746B),
              backgroundColor: 
              Color(0xFF9B4501),
              primaryColorLight: Color.fromARGB(253, 245, 137, 50),
              /// hoverColor: Colors.white,
              shadowColor: Colors.grey.shade700
            ),
            darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: darkColorScheme,
            useMaterial3: true,
            /// hoverColor: Colors.white,
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
              // '/home': (_) => HomePage(),
              '/home': (_) => BottomNavBar(),

              '/cadastrar': (_) => CadastroUser(),
              // AppRoutes.TREINO_FORM: (_) => TreinoForm(),
            },
          );
        // );
      })));
}
