import 'package:get/get.dart';

class Controller extends GetxController {
  String tipoExerc = '';

  void selectTipoExerc(int index) {
    if (index == 0) {
      tipoExerc = 'Máquina';
    } else if (index == 1) {
      tipoExerc = 'Hálteres';
    } else if (index == 2) {
      tipoExerc = 'Peso do corpo';
    }
    update();
  }
}