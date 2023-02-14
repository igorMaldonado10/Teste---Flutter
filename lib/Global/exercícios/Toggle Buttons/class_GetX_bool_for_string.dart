import 'package:get/get.dart';


class Controller extends GetxController {
  String tipoExerc = '';
  

  

  

  // void
   selectTipoExerc(int index) {
    if (index == 0) {
      tipoExerc = 'Máquina';
      // exercises!.tipo = 'Máquina';
      // tipoExerc = exercises!.tipo!;
      // exercises!.tipo = tipoExerc;
    } else if (index == 1) {
      tipoExerc = 'Hálteres';
      //  exercises!.tipo = 'Hálteres';
      // tipoExerc = exercises!.tipo!;
      // exercises!.tipo = tipoExerc;
    } else if (index == 2) {
      tipoExerc = 'Peso do corpo';
      //  exercises!.tipo = 'Peso do corpo';
      // tipoExerc = exercises!.tipo!;
      // exercises!.tipo = tipoExerc;
    }
    update();
  }
}
