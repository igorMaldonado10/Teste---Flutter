import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:teste/controllers/usuarioService.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({Key? key}) : super(key: key);

  @override
  State<CadastroUser> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  final email = TextEditingController();
  final senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        // Formulário
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          // (BoxDecoration = Add cor no nosso container, borda etc)
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(155, 149, 140, 100),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Título
              new Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 15),
                child: new Text(
                  'Cadastro de Contato',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 24),
                ),
              ),

              // Inputs(campos do formulário)
              //Campo de texto (nome)
              new Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  // Atributo que recebe valor do campo
                  controller: nome,

                  decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Dica: preencha todos os campos',
                      labelStyle:
                          TextStyle(color: Colors.grey.shade300, fontSize: 18),

                      // Borda do Input
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),

                      // Borda selecionada
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))),
                ),
              ),

              // Campo de textto (Sobrenome)
              campTexto('E-mail', email),

              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Divider(
                  height: 15,
                ),
              ),

              SizedBox(height: 15),

              //------Botões------

              // ignore: unnecessary_new
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão Cadastrar
                  // ignore: unnecessary_new
                  new Builder(builder: (BuildContext context) {
                    return ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: new Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),

                        // Cor do Botão
                        style: ElevatedButton.styleFrom(primary: Colors.orange),

                        // Ao pressionar ele, eu vou chamar o método cadastrar
                        onPressed: () {
                          cadastrar();
                        });
                  }),

                  // Botão Limpar
                  new Builder(builder: (BuildContext context) {
                    return ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: new Text(
                            'Limpar',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade600),
                        onPressed: () {
                          limpar();
                        });
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container campTexto(String title, final controller) {
  return new Container(
    margin: EdgeInsets.only(bottom: 10),
    child: new TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: title,
          labelStyle:
              TextStyle(color: Color.fromRGBO(224, 224, 224, 1), fontSize: 18),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.orange))),
    ),
  );
}

void cadastrar() {
  UsuarioService service = new UsuarioService();

  int ultimoID = service.listarUsuario().length;

  
}
