import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicios_list.dart';
import 'package:teste/Global/treino_2.0/cadastro_treino.dart';
import 'package:teste/Global/treino_2.0/editarTreino/informacoes.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/models/treino_model.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';

import '../../view/recursos/menuDrawer.dart';
// import '../treino_1.0/treino_tile.dart';
import 'dart:ui';

class TreinoList2 extends StatefulWidget {
  @override
  State<TreinoList2> createState() => _TreinoList2State();
}

class _TreinoList2State extends State<TreinoList2> {
  // Objeto do model
  TreinoService treinoService = new TreinoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appaBarHome(Text('Treino')),
        drawer: MenuDrawer(),
        body: ListView.builder(
            padding: EdgeInsets.fromLTRB(4, 8, 4, 75),
            itemCount: treinoService.listarTreinos().length,
            // recebo o índice e o contexto do elemento que vou retornar;
            itemBuilder: (BuildContext context, int index) {
              // Guarda o retorno da lista no objeto da classe

              // Objeto que busca o arquivo treino que retorna a simulação de banco de dados e faz a listagem por id;
              Treino_dois treino_dois = treinoService.listarTreinos().elementAt(index);

              return Container(
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                height: 150,
                color: Colors.grey.shade200,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListTile(
                  // leading:

                  // avatar,

                  title: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                treino_dois.tipoDeTreino,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  // iconSize: ,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new EditTreino(
                                                  id: treino_dois.id,
                                                )));
                                  },
                                  icon: Icon(
                                    Icons.more_vert_rounded,
                                    // color: darkColorScheme.secondary,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          new Text('Objetivo:' + ' ' + treino_dois.objetivo),
                          SizedBox(height: 5),
                          new Text(treino_dois.dataDoTreino),
                        ],
                      ),
                    ],
                  ),

                  trailing: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 70,
                    child: Row(
                      children: [
                        // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined)),
                        // IconButton(
                        //     iconSize: 25,
                        //     onPressed: () {},
                        //     icon: Icon(
                        //       Icons.delete,
                        //       color: lightColorScheme.error,
                        //     )),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 40,
                              onPressed: () {
                                // Cada treino tem o seu próprio ID, então, lógicamente cada ID tem a sua página de treino
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ExercisesList(id: treino_dois.id)));
                              },
                              icon: FaIcon(FontAwesomeIcons.chevronRight),
                              // icon: Icon(Icons.more_vert_rounded)
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
            child: FaIcon(FontAwesomeIcons.plus),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CadastroTreino()));
            }));
  }

  AppBar appaBarHome(Text texto) {
    return AppBar(
        automaticallyImplyLeading: false, //Esconde o ícone original (menu)

        centerTitle: true,
        title: texto,
        //  actions: [
        //   Switch(
        //       value: tema.value == ThemeMode.dark,
        //       onChanged: (isDark) {
        //         setState(() {
        //                 tema.value = isDark ? ThemeMode.dark : ThemeMode.light;
        //         });
        //       })
        // ],
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: FaIcon(FontAwesomeIcons.bars),
              onPressed: () => Scaffold.of(context).openDrawer());
        }));
  }
}
