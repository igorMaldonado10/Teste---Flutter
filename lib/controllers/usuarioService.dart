import 'package:teste/controllers/usu%C3%A1rios.dart';




// Simulando o BANCO DE DADOS com essa class/list
class UsuarioService {
  // Atributos da classe

  // Cria a lista de contatos
  // static = espécie de âncoragem que faz com que não modifique, consequentemente estático

  // 1º - Pegar da lista que já existe
  static List<DadosCadast> usuarios = [
    DadosCadast(
      id: 1,
      email: 'abner@gmail.com',
      senha: '123456')
  ];

  // Método para Cadastrar USUÁRIOS no App
  String cadastrarUsuario(DadosCadast usuario) {
    usuarios.add(usuario);

    return 'Cadastro concluído com sucesso';
  }

  List listarUsuario() {
    return usuarios;
  }
}
