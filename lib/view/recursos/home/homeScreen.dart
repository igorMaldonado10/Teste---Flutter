import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Profile/cadastro_perfil.dart';
import 'package:teste/view/recursos/barraSuperior.dart';
import 'package:teste/view/recursos/login/cadatroUsuario.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';
import 'package:teste/view/recursos/thema/theme.dart';

final tema = ValueNotifier(ThemeMode.light);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  colors: [ Theme.of(context).backgroundColor,Theme.of(context).canvasColor])),
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
                      SizedBox(
                        height: 10,
                      ),

                      // ListView.builder(
                      // padding: EdgeInsets.fromLTRB(4, 8, 4, 75),
                      // itemCount: treinoService.listarTreinos().length,
                      // // recebo o índice e o contexto do elemento que vou retornar, eu posso criar por ex. um text
                      // itemBuilder: (BuildContext context, int index) {
                      //   // Guarda o retorno da lista no objeto da classe

                      //   // Objeto que busca o arquivo treino que retorna a simulação de banco de dados e faz a listagem por id;
                      //   Treino_dois treino_dois = treinoService.listarTreinos().elementAt(index);

                      //   // exportação da lista de ARQuivos
                      //   final avatar = treino.icon == null || treino.icon.isEmpty
                      //       ? CircleAvatar(
                      //           radius: 35,
                      //           backgroundColor: Color(0xFF9B4501),
                      //           child: FaIcon(
                      //             FontAwesomeIcons.person,
                      //             color: Colors.white,
                      //             size: 30,
                      //           ))
                      //       : CircleAvatar(
                      //           backgroundImage: NetworkImage(treino.icon),
                      //         );

                      //   return Container(
                      //     // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      //     height: 150,
                      //     color: Colors.grey.shade200,
                      //     padding: EdgeInsets.all(5),
                      //     margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      //     child: ListTile(
                      //       // leading:

                      //       // avatar,

                      //       title: Row(
                      //         children: [
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Row(
                      //                 children: [
                      //                   Text(
                      //                     treino_dois.tipoDeTreino,
                      //                     style: TextStyle(
                      //                         fontSize: 25, fontWeight: FontWeight.bold),
                      //                   ),
                      //                   IconButton(
                      //                       // iconSize: ,
                      //                       onPressed: () {
                      //                         Navigator.push(
                      //                             context,
                      //                             MaterialPageRoute(
                      //                                 builder: (context) => new EditTreino(
                      //                                   id: treino_dois.id,
                      //                                 )
                      //                                 )
                      //                                 );
                      //                       },
                      //                       icon: Icon(
                      //                         Icons.more_vert_rounded,
                      //                         // color: darkColorScheme.secondary,
                      //                       )),
                      //                 ],
                      //               ),
                      //               SizedBox(
                      //                 height: 10,
                      //               ),
                      //               new Text('Objetivo:' + treino_dois.objetivo),
                      //               SizedBox(height: 5),
                      //               new Text(treino_dois.dataDoTreino),
                      //             ],
                      //           ),
                      //         ],
                      //       ),

                      //       trailing: Container(
                      //         alignment: Alignment.center,
                      //         height: 100,
                      //         width: 70,
                      //         child: Row(
                      //           children: [
                      //             // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined)),
                      //             // IconButton(
                      //             //     iconSize: 25,
                      //             //     onPressed: () {},
                      //             //     icon: Icon(
                      //             //       Icons.delete,
                      //             //       color: lightColorScheme.error,
                      //             //     )),

                      //             Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 IconButton(
                      //                   iconSize: 40,
                      //                   onPressed: () {},
                      //                   icon: FaIcon(FontAwesomeIcons.chevronRight),
                      //                   // icon: Icon(Icons.more_vert_rounded)
                      //                 ),
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   );

                      // })

                    
                      // Bottom profile
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
                              builder: ((context) => HomePage())));
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
              activeColor: Theme.of(context).backgroundColor,
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
