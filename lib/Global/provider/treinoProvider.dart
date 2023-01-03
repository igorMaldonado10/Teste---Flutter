// O objetivo do provider e fazer com que externalize o arquivo (no caso a lista) para não precisar ficar acessando diretamente a lista dentro de um determinado widget

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teste/Global/treino_arq.dart';
import 'package:teste/model/treino_model.dart';

// ChangeNotifier : mixin

class TreinosProvider with ChangeNotifier {
  final Map<String, Treino> _items = {...TREINOS_ARQ};

  List<Treino> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Treino byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(Treino treino) {
    if (treino == null) {
      return;
    }

    // método trim() tira os espaços em branco

    if (treino.id != null &&
        treino.id.trim().isNotEmpty &&
        _items.containsKey(treino.id)) {
      // Alterar
      _items.update(treino.id, (_) => Treino(
        id: treino.id, 
        icon: treino.icon,
        tipoDeTreino: treino.tipoDeTreino,
        dataDoTreino: treino.dataDoTreino,
        objetivo: treino.objetivo));
    } else {
      // Adicionar
      // Quando o usuário não tem ID significa que é um novo elemento, ai ele vai adicionar aqui
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Treino(
            id: id,
            icon: treino.icon,
            tipoDeTreino: treino.tipoDeTreino,
            dataDoTreino: treino.dataDoTreino,
            objetivo: treino.objetivo),
      );
    }

    // ou alterar

    // No final irei chamar o notifyListeners para que o provider possa ser notificado que houve uma mudança e quando houver uma mudança ele irá halterar a ínterface

    notifyListeners();
  }

  void remove(Treino treino) {
    if (treino != null && treino.id != null) {
      _items.remove(treino.id);
      // chamo o notifyListeners() só para garantir que ele notificará quem efetuará qualquer mudança dentro do changeNotify/provider
      notifyListeners(); 
    }
  }
}
