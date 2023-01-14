import 'package:teste/Profile/perfil_model.dart';

class PerfilService {
  static List<User> perfil = [];

  void atualizarUser(int id) {
    perfil[id];
  }

  String removerTreino(int id) {
    perfil.removeWhere((element) => element.id == id);

    return "Treino excluido";
  }

  // Método para cadastrar os treinos na treino_list2
  String cadastrarPerfil(User user) {
      perfil.add(user);

      return "Perfil cadastrado ${user.name}";
    
  }

  List listaUser() {
    // Simulando o bando de dados

    // user = [
    //   User(
    //     id: 0,
    //     name: 'Igor Maldonado',
    //     dataNasc: '20/10/04',
    //     pesoAtual: '74',
    //     icon: '',
    //     textBio: 'Rumo aos 80kg')
    // ];

    return perfil;
  }
}
