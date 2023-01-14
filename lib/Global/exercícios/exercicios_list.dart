import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/exerc%C3%ADcios/cadastro_exercicio.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicios_service.dart';
import 'package:teste/Global/treino_2.0/cadastro_treino.dart';
import 'package:teste/Global/treino_2.0/editarTreino/informacoes.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercises.dart';
// import 'package:teste/models/treino_model.dart';
// import 'package:teste/view/recursos/home/homeScreen.dart';
// import 'package:teste/view/recursos/thema/color_schemes.g.dart';

import '../../view/recursos/menuDrawer.dart';

class ExercisesList extends StatefulWidget {
// Guardar a ID do treino selecionado
  final int id;


// Guardar a list do treino selecionado
  // final List list;

  // Construtor com o atributo obrigatório (id)
  ExercisesList({ required this.id });

  @override
  State<ExercisesList> createState() => _ExercisesListState();
}

class _ExercisesListState extends State<ExercisesList> {
  // Objeto do model
  TreinoService treinoService = new TreinoService();

// Objeto que busca o arquivo exercicio que retorna a simulação de banco de dados;
  final ExercicioService exercicioService = new ExercicioService();

  bool? exerCheck = false;

  @override
  Widget build(BuildContext context) {
    //  // Objeto da classe Treino
    //  Treino_dois treino = treinoService.listarExercicios().elementAt(widget.id - 1);
    Treino_dois treino =
    exercicioService.listarExercicios().elementAt(widget.id - 1);
    // Exercises exercises = exercicioService.listarExercicios().elementAt(widget.id - 1);

    return Scaffold(
      appBar: appaBarHome(Text('Exercícios')),
      drawer: MenuDrawer(),
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(4, 8, 4, 75),
          itemCount: exercicioService.listarExercicios().length,
          // recebo o índice e o contexto do elemento que vou retornar;
          itemBuilder: (BuildContext context, int index) {
            // Guarda o retorno da lista no objeto da classe
            //         // Objeto que busca o arquivo exercicíos que retorna a simulação de banco de dados e faz a listagem por id;

            Exercises exercises =
                exercicioService.listarExercicios().elementAt(index);
            // Treino_dois treino_dois = treinoService.listarExercicios().elementAt(index);
            int _numInicial = 0;
            // void increment() {
            //   // for (int i = 0; i <= int.parse(exercises.numSeries); i++) {
            //   setState(() {
            //     if (_numInicial <= exercises.numSeries) {
            //       _numInicial++;
            //       // }
            //     }
            //   });
            // }

            // void decrement() {
            //   setState(() {
            //     _numInicial--;
            //   });
            // }

            // ;

            return Container(
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              height: 150,
              // width: 200,
              color: Theme.of(context).cardColor,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ListTile(
                // leading:

                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              exercises.name,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Checkbox(
                                activeColor: Color.fromRGBO(211, 111, 47, 100),
                                value: this.exerCheck,
                                onChanged: (newValue) {
                                  setState(() {
                                    this.exerCheck = newValue;
                                  });
                                }),

                            // IconButton(
                            //     // iconSize: ,
                            //     onPressed: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) =>
                            //                   new EditExercises(
                            //                     id: exercises.id,
                            //                   )));
                            //     },
                            //     icon: Icon(
                            //       Icons.more_vert_rounded,
                            //       // color: darkColorScheme.secondary,
                            //     )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new Text(
                            'nº repetições:' + ' ' + '${exercises.numRepeti}'),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            new Text('Séries:' + ' '),
                            IconButton(
                                onPressed: () {
                                  // decrement();
                                },
                                icon: FaIcon(FontAwesomeIcons.minus)),
                            new Text('$_numInicial'),
                            new Text('/'),
                            new Text('${exercises.numSeries}'),
                            IconButton(
                                onPressed: () {
                                  // increment();
                                },
                                icon: FaIcon(FontAwesomeIcons.plus))
                          ],
                        ),
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
                            onPressed: () {},
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
                MaterialPageRoute(builder: (context) => CadastroExercicio(id: widget.id,)));
          }),
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
