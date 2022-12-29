import 'package:flutter/material.dart';

class Usuario {
  String? name;
  String? email;
  String? senha;
  bool? keep0n;

  Usuario({this.name, this.email, this.senha, this.keep0n});

  Usuario.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    senha = json['senha'];
    keep0n = json['keep0n'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['keep0n'] = this.keep0n;
    return data;
  }

  String toString() {
    return "Nome:" +
        "${this.name}" +
        "\nE-mail:" +
        "${this.email}" +
        "\nSenha:" +
        "${this.senha}";
  }
}
