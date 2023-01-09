import 'package:flutter/material.dart';

class User {
  late int id;
  late String name;
  late String dataNasc;
  late String pesoAtual;
  late String icon;
  late String textBio;

  User(
      {required this.id,
      required this.name,
      required this.dataNasc,
      required this.pesoAtual,
      required this.icon,
      required this.textBio});

  void add(User user) {}
}
