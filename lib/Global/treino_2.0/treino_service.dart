import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/models/treino_model.dart';

class TreinoService {
  List listarTreinos() {
    // Cria a lista de contatos
    List<Treino_dois> treinos = [
     Treino_dois(
      id: 1, 
      icon: '', 
      tipoDeTreino: 'Treino A', 
      dataDoTreino: '31/12/22',
       objetivo: 'Hipertrofia'),
      
      Treino_dois(
      id: 2 , 
      icon: '', 
      tipoDeTreino: 'Treino B', 
      dataDoTreino: '31/12/22',
      objetivo: 'Perda de peso'),
      
      Treino_dois(
      id: 3, 
      icon: '', 
      tipoDeTreino: 'Treino C', 
      dataDoTreino: '31/12/22',
       objetivo: 'Resistência'),



    ];

    return treinos;
  }
}
