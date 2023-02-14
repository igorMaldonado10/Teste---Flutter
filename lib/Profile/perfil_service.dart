import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:teste/Profile/model/perfil_model.dart';

class PerfilService extends ChangeNotifier {
  static List<User> perfil = [];

  List<User> perfilView = perfil;

  UnmodifiableListView<User> get perfilGet => UnmodifiableListView(perfilView);

 

  // Método para cadastrar o Usuário 
  String cadastrarPerfil(User user) {
    perfil.add(user);

    notifyListeners();

    return "Perfil cadastrado: ${user.name}";
  }

  atualizarNomeSobrenome(User user, String nome, String sobrenome) {
    user.name = nome;
    user.sobrenome = sobrenome;

    notifyListeners();
  }

   atualizarNascimento(User user, String nascimento) {
    user.dataNasc = nascimento;

    notifyListeners();
  }

   atualizarPeso(User user, String peso) {
    user.pesoAtual = peso;
 
    notifyListeners();
  }

   atualizarBio(User user, String bio) {
    user.textBio = bio;
 
    notifyListeners();
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
