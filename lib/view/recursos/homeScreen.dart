import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/view/recursos/barraSuperior.dart';
import 'package:teste/view/recursos/menuDrawer.dart';

final tema = ValueNotifier(ThemeMode.light);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appaBarHome(Text('Home')),
        drawer: MenuDrawer(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color.fromRGBO(186, 188, 190, 100)])),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/imgs/image_pag_in.png',
                          // fit: BoxFit.fitWidth,
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            // ícone Home
            BottomNavigationBarItem(
                label: 'Home',
                icon: new IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => HomeScreen())));
                    },
                    icon: new FaIcon(FontAwesomeIcons.houseChimney))),

            BottomNavigationBarItem(
                label: 'Perfil',
                icon: new IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.solidCircleUser)))
          ],
        ));
  }

  AppBar appaBarHome(Text texto) {
    return AppBar(
        automaticallyImplyLeading: false, //Esconde o ícone original (menu)

        centerTitle: true,
        title: texto,
        actions: [
          Switch(
              value: tema.value == ThemeMode.dark,
              onChanged: (isDark) {
                setState(() {
                  tema.value = isDark ? ThemeMode.dark : ThemeMode.light;
                });
              })
        ],
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: FaIcon(FontAwesomeIcons.bars),
              onPressed: () => Scaffold.of(context).openDrawer());
        }));
  }
}
