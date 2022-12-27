import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:teste/controllers/usuários.dart';
import 'package:teste/controllers/usuarioService.dart';
import 'package:teste/view/login_page.dart';
import 'package:teste/view/theme.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({Key? key}) : super(key: key);

  @override
  State<CadastroUser> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  final email = TextEditingController();
  final senha = TextEditingController();
  
  DadosCadast get  usuario => usuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      // appBar: AppBar(),
      body: SingleChildScrollView(
        // Formulário
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          // (BoxDecoration = Add cor no nosso container, borda etc)
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(155, 149, 140, 100),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Título
              new Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 15),
                child: new Text(
                  'Cadastrar Usuário',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),

              // Inputs(campos do formulário)
              //Campo de texto (email)
              new Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  // Atributo que recebe valor do campo
                  controller: email,
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'exemplo: nome@gmail.com',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),

                      // Borda do Input
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),

                      // Borda selecionada
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))),
                ),
              ),

              // Campo de textto (Sobrenome)
              campTexto('Senha', senha),

              Container(
                // padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Divider(
                  height: 50,
                  color: Colors.white,
                ),
              ),

              // SizedBox(height: 15),

              //------Botões------

              // ignore: unnecessary_new
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão Cadastrar
                  // ignore: unnecessary_new
                  Container(
                    width: 280,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              cadastrar();
                            },
                            child: new Text('Cadastrar')),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container campTexto(String title, final controller) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            labelText: title,
            labelStyle: TextStyle(
                color: Color.fromRGBO(224, 224, 224, 1), fontSize: 18),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange))),
      ),
    );
  }

  void cadastrar() {
    UsuarioService service = new UsuarioService();

    // Guardar ultimo ID cadastrado
    int ultimoID = service.listarUsuario().length;

    DadosCadast dadosCadast =
        DadosCadast(
          id: ultimoID + 1,
          email: email.text,
          senha: senha.text);

    String mensagem = service.cadastrarUsuario(usuario);

    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text(
        mensagem,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey.shade300),
      ),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    )); 

    // Redirecionamento para a login page

    Future.delayed(Duration(milliseconds: 1500), (() {
      // CircularProgressIndicator();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    })); 
  }

  
}


