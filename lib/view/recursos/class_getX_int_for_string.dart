import 'package:get/get.dart';

class ControlAppBar extends GetxController {
  String page = '';
  
  // final Exercises? exercises;

  // Controller({this.exercises});
  

  

  // void
   selectPage(int index) {
    if (index == 0) {
      page = 'Home';
      // exercises!.tipo = 'Máquina';
      // tipoExerc = exercises!.tipo!;
      // exercises!.tipo = tipoExerc;
    } if (index == 1) {
      page = 'Perfil';
      //  exercises!.tipo = 'Hálteres';
      // tipoExerc = exercises!.tipo!;
      // exercises!.tipo = tipoExerc;
    }; 
    update();
  }
}