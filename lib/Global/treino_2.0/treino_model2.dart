import 'package:flutter/material.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercises.dart';

class Treino_dois {
  // Atributos
  int? id;
  // late String icon;
  String? tipoDeTreino;
  String? dataDoTreino;
  String? objetivo;

  // static 
  

  
  // Construtor
  Treino_dois(
      {this.id,
      // required this.icon,
       this.tipoDeTreino,
       this.dataDoTreino,
       this.objetivo,
      
      // required this.listExercises
      });

   List<Exercises>? listExercises;
}
