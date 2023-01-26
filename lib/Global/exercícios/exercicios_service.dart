import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';

// class ExercicioService {
//   // ATRIBUTOS DA CLASSE

//   // Lista que será preenchida
//   // static = ela não se criará mais de uma vez, ou seja, não se modifica
//   static List<Exercises> exercicios = [];

//   void atualizarExercicio(int id) {
//     exercicios;
//   }

//   String removerExercicio(int id) {
//     exercicios.removeWhere((element) => element.id == id);

//     return "Treino excluido";
//   }

//   // Método para cadastrar os treinos na treino_list2
//   String cadastrarExercicio(Exercises exercises, int id) {
//     TreinoService treinoService = TreinoService();
//     Treino_dois treino = treinoService.listarTreinos().elementAt(id);

//     treino.listExercises!.add(exercises);
//     // exercicios.add(exercises);

//     return "Novo exercício cadastrado: ${exercises.name}";
//   }

//   // Método para buscar todos os treinos registrados
//   List listarExercicios() {
//     // Simulando o bando de dados

//     // exercicios = [
//     // Exercises(
//     //       id: 1,
//     //       name: 'Cadeira flexora',
//     //       grupoMusc: 'Posterior de coxa',
//     //       // Maquina, livre com halteres, peso do corpo
//     //       tipo: 'Máquina',
//     //       obs: 'Vázia',
//     //       numSeries: 4.toString(),
//     //       numRepeti: '20',
//     //       restTime: '2 min'
//     //       )

//     // ];

//     //  Exercises(
//     //     id: 2,
//     //     name: 'Cadeira flexora',
//     //     grupoMusc: 'Posterior de coxa',
//     //     // Maquina, livre com halteres, peso do corpo
//     //     tipo: 'Máquina',
//     //     obs: 'Vázia',
//     //     numSeries: 4,
//     //     numRepeti: '20',
//     //     restTime: '2 min'
//     //     );

//     return exercicios;
//   }
// }
