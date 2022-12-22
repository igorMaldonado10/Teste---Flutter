// Simulando o BANCO DE DADOS com essa class/list
import 'package:teste/controllers/usu%C3%A1rios.dart';

class UsuarioService {
  // Atributos da classe

  // Cria a lista de contatos
  // static = espécie de âncoragem que faz com que não modifique, consequentemente estático

  // 1º - Pegar da lista que já existe
  static List<DadosCadast> usuarios = [];

  // Método para Cadastrar USUÁRIOS no App
  String cadastrarUsuario(DadosCadast usuario) {
    usuarios.add(usuario);

    return 'Cadastro concluído com sucesso';
  }

  List listarUsuario() {
    return usuarios;
  }
}
