import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';

class TreinoService extends ChangeNotifier {
  // List<Exercises> exercises = treino_dois!.listExercises!;

  /// Método para remover os exercicios na lista de cada treino especifico
  String removerExercicio(int id, Treino_dois treino) {
    treino.listExercises?.removeAt(id);

    notifyListeners();

    /// treino.listExercises?.removeWhere((element) => element.id == id);
    /// exercicios.removeWhere((element) => element.id == id);

    return "Exercício excluido";
  }

  /// Método para cadastrar os exercicios na lista de cada treino especifico
  String cadastrarExercicio(Exercises exercises, Treino_dois treino) {
    treino.listExercises?.add(exercises);

    notifyListeners();

    return "Novo exercício cadastrado: ${exercises.name}";
  }

  // ATRIBUTOS DA CLASSE

  // Lista que será preenchida através dos métodos abaixo
  // static = ela não se criará mais de uma vez, ou seja, não se modifica
  static List<Treino_dois> treinos = [];
  // bool isSorted = false;

  //List que recebe a lista de treinos que já está preenchida (criei par conseguir receber a lista preenchida na searchPageTreinos)
  List<Treino_dois> treinos2 = treinos;

  List<Treino_dois> display_list = List.from(treinos);

  UnmodifiableListView<Treino_dois> get treinosGet =>
      UnmodifiableListView(treinos2);

  // void updateList(String value) {}
  // List pegarList() {
  //   return treinos;
  // }

  String atualizarExercicio(
      {required Exercises exercises,
       required String name,
      required String numSeries,
      required String numReps,
      required String grupoMusc,
      required String tipo,
      required String obs,
      required String restTime}) {
    exercises.name = name;
    exercises.numSeries = int.parse(numSeries);
    exercises.numRepeti = int.parse(numReps);
    exercises.grupoMusc = grupoMusc;
    exercises.tipo = tipo;
    exercises.obs = obs;
    exercises.restTime = restTime;

    notifyListeners();

    return 'Exercício atualizado';
  }

  String atualizarTreino(
      Treino_dois treino, String tipo, String objetivo, String data) {
    treino.tipoDeTreino = tipo;
    treino.objetivo = objetivo;
    treino.dataDoTreino = data;

    notifyListeners();

    return 'Treino atualizado';
  }

  String removerTreino(int id) {
    treinos.removeWhere((element) => element.id == id);

    notifyListeners();

    return "Treino excluido";
  }

  // Método para cadastrar os treinos na treino_list2
  String cadastrarTreino(Treino_dois treino_dois) {
    treinos.add(treino_dois);

    notifyListeners();

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
}
