import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/exerc%C3%ADcios/cadastro_exercicio.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicio_item.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/exerc%C3%ADcios/searchPageExercises.dart';
import 'package:teste/Global/treino_1.0/treino_list.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/view/recursos/menuDrawer.dart';

class ExercisesList extends StatefulWidget {
  /// Guardar a ID do treino selecionado
  /// final int id;
  final Treino_dois? treino;

  /// final int? id;
  ///
  /// Guardar a ID do treino selecionado
  /// Construtor com o atributo (id)
  ExercisesList(this.treino);

  @override
  State<ExercisesList> createState() => _ExercisesListState();
}

class _ExercisesListState extends State<ExercisesList> {
  // Objeto do model
  TreinoService treinoService = new TreinoService();

// Objeto que busca o arquivo exercicio que retorna a simulação de banco de dados;
  bool? exerCheck = false;

  @override
  Widget build(BuildContext context) {
    /// Objeto da classe Treino
    ///  Treino_dois treino = treinoService.listarExercicios().elementAt(widget.id - 1);

    /// Treino_dois treino = exercicioService.listarExercicios().elementAt(widget.id -1);
    /// Treino_dois treino = treinoService.listarTreinos().elementAt(widget.id - 1);

    /// Exercises exercises = exercicioService.listarExercicios().elementAt(widget.id - 1);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Exercícios' + ' - ' '${widget.treino!.tipoDeTreino}'),
          actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SearchPageExerc(
                                  treino: widget.treino,
                                )
                            // treinoService.searchPage()

                            )));
              },
              icon: Icon(Icons.search))
        ]),
      //  appaBarHome(
      //     Text('Exercícios' + ' - ' '${widget.treino!.tipoDeTreino}')),
      // drawer: MenuDrawer(),
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(4, 8, 4, 75),
          itemCount: widget.treino?.listExercises?.length ??
              0 // exercicioService.listarExercicios().length
          ,
          // recebo o índice e o contexto do elemento que vou retornar;
          itemBuilder: (BuildContext context, int index) {
            // Guarda o retorno da lista no objeto da classe
            // Objeto que busca o arquivo exercicíos que retorna a simulação de banco de dados e faz a listagem por id;

            // Exercises? exercises =
            //     treinoService.listarTreinos().elementAt(index);
            // Exercises exercises = treino!.listExercises!.elementAt(index);

            // Exercises exercises =
            //     exercicioService.listarExercicios().elementAt(index);

            // Treino_dois treino_dois = treinoService.listarExercicios().elementAt(index);
            int _numInicial = 0;

            return ListExerciseItem(
              exercises: widget.treino!.listExercises![index],
              treino: widget.treino,
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.plus),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastroExercicio(
                          treino: widget.treino,
                        )));
          }),
    );
  }

  AppBar appaBarHome(Text texto) {
    return AppBar(
        automaticallyImplyLeading: false, //Esconde o ícone original (menu)

        centerTitle: true,
        title: texto,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SearchPageExerc(
                                  treino: widget.treino,
                                )
                            // treinoService.searchPage()

                            )));
              },
              icon: Icon(Icons.search))
        ]);
  }
  // leading: Builder(builder: (BuildContext context) {
  //   return IconButton(
  //       icon: FaIcon(FontAwesomeIcons.bars),
  //       onPressed: () => Scaffold.of(context).openDrawer());
  // }
  // )
}
