import 'package:flutter/material.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/models/treino_model.dart';

class TreinoService {
  /// Lista que será preenchida
  /// static = ela não se criará mais de uma vez, ou seja, não se modifica
  /// static List<Exercises> exercicios = [];

  /// void atualizarExercicio(int id) {
  ///   exercicios;
  /// }

  /// Método para remover os exercicios na lista de cada treino especifico
  String removerExercicio(int id, Treino_dois treino) {
    treino.listExercises?.removeAt(id);

    /// treino.listExercises?.removeWhere((element) => element.id == id);
    /// exercicios.removeWhere((element) => element.id == id);

    return "Exercício excluido";
  }

  /// Método para cadastrar os exercicios na lista de cada treino especifico
  String cadastrarExercicio(Exercises exercises, Treino_dois treino) {
    /// Treino_dois treino = listarTreinos().elementAt(id);

    treino.listExercises?.add(exercises);

    return "Novo exercício cadastrado: ${exercises.name}";
  }

  /// Método para buscar todos os treinos registrados
  /// List listarExercicios() {
  /// Simulando o bando de dados

  /// Exercises(
  ///     id: 1,
  ///     name: 'Cadeira flexora',
  ///     grupoMusc: 'Posterior de coxa',
  ///     // Maquina, livre com halteres, peso do corpo
  ///     tipo: 'Máquina',
  ///     obs: 'Vázia',
  ///     numSeries: 4,
  ///     numRepeti: '20',
  ///     restTime: '2 min'
  ///     );

  ///  Exercises(
  ///     id: 2,
  ///     name: 'Cadeira flexora',
  ///     grupoMusc: 'Posterior de coxa',
  /// Maquina, livre com halteres, peso do corpo
  ///     tipo: 'Máquina',
  ///     obs: 'Vázia',
  ///     numSeries: 4,
  ///     numRepeti: '20',
  ///     restTime: '2 min'
  ///    );

  //   return exercicios;
  // }

  // ATRIBUTOS DA CLASSE

  // Lista que será preenchida através dos métodos abaixo
  // static = ela não se criará mais de uma vez, ou seja, não se modifica
  static List<Treino_dois> treinos = [];

  //variável List que recebe a lista de treinos que já está preenchida
  List<Treino_dois> treinos2 = treinos;

  List<Treino_dois> display_list = List.from(treinos);


  // void updateList(String value) {}
  // List pegarList() {
  //   return treinos;
  // }

  String removerTreino(int id) {
    treinos.removeWhere((element) => element.id == id);

    return "Treino excluido";
  }

  // Método para cadastrar os treinos na treino_list2
  String cadastrarTreino(Treino_dois treino_dois) {
    treinos.add(treino_dois);

    return "Novo treino cadastrado: ${treino_dois.tipoDeTreino}";
  }

  // Método para buscar todos os treinos registrados
  List listarTreinos() {
    // Simulando o bando de dados

    /// treinos = [
    ///   Treino_dois(
    ///       id: 1,
    ///       tipoDeTreino: 'Treino A',
    ///       dataDoTreino: '31/12/22',
    ///       objetivo: 'Hipertrofia',
    ///       listExercises: [
    ///         // Exercises(
    ///         //  name: 'Supino Reto',
    ///         //  grupoMusc: 'Peito',
    ///         //  tipo: 'Halteres',
    ///         //  obs: 'Aplitude máxima',
    ///         //  numSeries: 4,
    ///         //  numRepeti: 12,
    ///         //  restTime: '2 min'),

    //       ]),
    //   Treino_dois(
    //       id: 2,
    //       tipoDeTreino: 'Treino B',
    //       dataDoTreino: '31/12/22',
    //       objetivo: 'Perda de peso',
    //       listExercises: [
    //         Exercises(
    //           name: 'Agachamento',
    //           grupoMusc: 'Peito',
    //           tipo: 'Halteres',
    //           obs: 'Amplitude ',
    //           numSeries: 4,
    //           numRepeti: 12,
    //           restTime: '2 minutos')
    //       ] ),
    //   Treino_dois(
    //       id: 3,
    //       tipoDeTreino: 'Treino C',
    //       dataDoTreino: '31/12/22',
    //       objetivo: 'Resistência',
    //       listExercises: [
    //         // Exercises(
    //         //   name: 'Elevação Lateral',
    //         //   grupoMusc: 'Ombro',
    //         //   tipo: 'Halteres',
    //         //   obs: 'Limite da linha do ombro',
    //         //   numSeries: 4,
    //         //   numRepeti: 12,
    //         //   restTime: '1 min e 30 segs')
    //       ]),
    // ];

    return treinos;
  }

// // Aqui Search Page
  // Scaffold searchPage() {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: Padding(
  //       padding: EdgeInsets.all(16),
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Procurar treino",
  //               style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(height: 20),
  //             TextField(
  //               decoration: InputDecoration(
  //                   filled: true,
  //                   border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8.0),
  //                       borderSide: BorderSide.none),
  //                   hintText: "ex.: Treino A",
  //                   prefixIcon: Icon(Icons.search)),
  //             ),
  //             SizedBox(height: 20),
  //             Expanded(
  //                 child: ListView.builder(
  //                     itemCount: display_list.length,
  //                     itemBuilder: ((context, index) => ListTile(
  //                           contentPadding: EdgeInsets.all(8.0),
  //                           title: Text(display_list[index].tipoDeTreino!),
  //                           subtitle:
  //                               Text("${display_list[index].dataDoTreino}"),
  //                         ))))
  //           ]),
  //     ),
  //   );
  // }
}
