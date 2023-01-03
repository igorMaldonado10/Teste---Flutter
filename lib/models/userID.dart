import 'package:teste/models/user_abstract.dart';
import 'package:teste/models/user_atleta.dart';

class UserID extends AbstractUser {
  // Lista de ID dos users
  late List<int> listUserIds;

  // Lista dos users
  late List<UserAtleta> listAtlet;
}
