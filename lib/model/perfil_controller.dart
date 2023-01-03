import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String dataNasc;
  final String pesoAtual;
  final String textBio;


  const User({
   required this.id,
   required this.name,
   required this.dataNasc,
   required this.pesoAtual,
   required this.textBio
  });
}
