import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/treino_2.0/treino_list2.dart';
import 'package:teste/Profile/perfil_page.dart';
import 'package:teste/view/recursos/IMC/calc_ims.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';
import 'package:teste/view/recursos/menuDrawer.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // final controller = Get.put(ControlAppBar());
  int _opcaoSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appaBarHome((_opcaoSelecionada == 1) ? Text('Home'): Text('Perfil')),
      drawer: MenuDrawer(),
      body: IndexedStack(
        index: _opcaoSelecionada,
        children: [ HomePage(), TreinoList2(), CalculadoraIMC(), PerfilPage(),  ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _opcaoSelecionada,
          onTap: (opcao) {
            print('Clicou $opcao');

            setState(() {
              _opcaoSelecionada = opcao;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: new FaIcon(
                FontAwesomeIcons.houseChimney,
              ),
            ),
             BottomNavigationBarItem(
                label: 'Treinos', icon: FaIcon(FontAwesomeIcons.dumbbell)),
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'IMC'),
            BottomNavigationBarItem(
                label: 'Perfil', icon: new FaIcon(FontAwesomeIcons.solidCircleUser)),
           
          ]),
    );
  }


}

