import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';

class HistoricoService {
  // List marcas = [];

  static List<Treino_dois> treinosExecutados = [];

  List<Treino_dois> treinosExecutadosView = treinosExecutados;

  List listarTreinosExecut() {
    return treinosExecutados;
  }

  // void incrementExecucoes(Treino_dois treino) {
  //   /// Treino_dois treino = listarTreinos().elementAt(id);

  //   treino.listExecucoes!.add(treino);

  //   // return "Novo exercício cadastrado: ${exercises.name}";
  // }

  void addTempoDeTreino(Treino_dois treino_dois, String tempoDeTreino) {
    // treino_dois.marcas!.add(tempoDeTreino);
  }

  String executarTreino(Treino_dois treino_dois) {
    // treino_dois.marcas!.add(tempoDeTreino);

    treinosExecutados.add(treino_dois);

    // treino_dois.listExecucoes?.add(treino_dois);

    // print('${treino_dois.tipoDeTreino} foi executado :erroe' '${treino_dois.execucoesDeTreino}');

    // treino_dois.marcas!.add(tempoDeTreino);

    return "${treino_dois.tipoDeTreino} executado";
  }
}
