
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicios_list.dart';
import 'package:teste/Global/treino_2.0/cadastro_treino.dart';
import 'package:teste/Global/treino_2.0/editarTreino/informacoes.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';
import 'package:teste/view/recursos/menuDrawer.dart';

class TreinoList2 extends StatefulWidget {
  @override
  State<TreinoList2> createState() => _TreinoList2State();
}

class _TreinoList2State extends State<TreinoList2> {
  // Objeto do model
  // Objeto criado para utilizar os métodos dessa classe
  TreinoService treinoService = new TreinoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appaBarHome(Text('Treino')),
        drawer: MenuDrawer(),
        body: 
        
        (treinoService.listarTreinos().length == null || treinoService.listarTreinos().isEmpty)?
        SingleChildScrollView(
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.faceSadTear,
                            size: 200,
                            color: Theme.of(context).shadowColor,
                          ),

                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 15),
                          child: Text('PÁGINA VAZIA',
                          style: TextStyle(
                            fontSize: 23,
                            color: Theme.of(context).shadowColor
                          ),),
                        )
                         
                        ],
                      ),
                    ),
                  ],
                ),
        ):
        
        ListView.builder(
            padding: EdgeInsets.fromLTRB(4, 8, 4, 75),
            itemCount: treinoService.listarTreinos().length,

            // recebo o índice e o contexto do elemento que vou retornar;
            itemBuilder: (BuildContext context, int index) {

              // Guarda o retorno da lista no objeto da classe
              // Objeto que busca o arquivo treino que retorna a simulação de banco de dados e faz a listagem por id;
              Treino_dois treino_dois =
                  treinoService.listarTreinos().elementAt(index);

              return Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor),
                height: 150,
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
                                treino_dois.tipoDeTreino! ,
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
                                                  id: treino_dois.id!,
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
                          new Text('Objetivo:' + ' ' + treino_dois.objetivo! ),
                          SizedBox(height: 5),
                          new Text(treino_dois.dataDoTreino ?? ''),
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
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>
                               ExercisesList(id: treino_dois.id!)));
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
            }),
            bottomNavigationBar: barraInferior(), 
            
            );
  }
   BottomNavigationBar barraInferior(){
    return BottomNavigationBar(items: [
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
    ]
    );
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
