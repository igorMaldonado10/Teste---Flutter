import 'package:flutter/material.dart';

class Treino {
  // Atributos
  final String id;
  final String icon;
  final String tipoDeTreino;
  final String dataDoTreino;
  final String objetivo;

  // Construtor
  const Treino({
    required this.id,
    required this.icon,
    required this.tipoDeTreino,
    required this.dataDoTreino,
    required this.objetivo,
  });
}
