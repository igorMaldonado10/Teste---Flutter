import 'package:flutter/material.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';

class Treino_dois {
  // Atributos
  int? id;
  // late String icon;
  String? tipoDeTreino;
  String? dataDoTreino;
  String? objetivo;
  final DateTime? date;
  List<Exercises>? listExercises;
  String? marca;
  // List? marcas;
  // static

  // Construtor
  Treino_dois({
    this.id,
    // required this.icon,
    this.tipoDeTreino,
    this.dataDoTreino,
    this.objetivo,
    this.date,
    this.listExercises,
    this.marca
    //  this.marcas
    // required this.listExercises
  });
}
