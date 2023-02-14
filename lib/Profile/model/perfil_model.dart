import 'package:image_picker/image_picker.dart';

class User {
  late int id;
  late String name;
  late String sobrenome;
  late String dataNasc;
  late String pesoAtual;
  late PickedFile icon;
  late String textBio;

  User(
      {required this.id,
      required this.name,
      required this.sobrenome,
      required this.dataNasc,
      required this.pesoAtual,
      required this.icon,
      required this.textBio});

  // void add(User user) {}
}
