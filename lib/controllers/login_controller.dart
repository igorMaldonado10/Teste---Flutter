// Classe que vai fazer a validação dos dados
import 'package:flutter/foundation.dart';
import 'package:teste/controllers/usuarioService.dart';
import 'package:teste/controllers/usu%C3%A1rios.dart';

class LoginController {
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _senha;
  setSenha(String value) => _senha = value;

  // auth = authentication
  //Future = irá realizar uma ação futura, que no caso é a validação
  Future<bool> auth() async {
    UsuarioService service = UsuarioService();

    loading.value = true;
    await Future.delayed(Duration(seconds: 2));
    loading.value = false;
    // await = aplicamos essa propriedade para fezer comm que esse ação seja realizada então da próxima linha de comando

    return _login == 'igorMS10' && _senha == 'li3826ab';
  }
}

//OnChanged/ Quando o usuário começar a digitar, atibuir o valor para a string que foi criada no caso(_login e _senha).
