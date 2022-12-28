import 'dart:ffi';

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
  bool? showPassword = false;

  TextEditingController _nomeInputController = TextEditingController();
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _senhaInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  DadosCadast get usuario => usuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Color.fromRGBO(211, 111, 47, 100)])),
            child: SingleChildScrollView(
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

                  // Inputs(campos do /formulário)
                  //Campo de texto (email)
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nomeInputController,
                          autofocus: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Nome Completo",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        TextFormField(
                          controller: _emailInputController,
                          autofocus: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.white,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 15,
                          ),
                        ),
                        TextFormField(
                          controller: _senhaInputController,
                          obscureText:(this.showPassword == true) ? false : true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key_sharp,
                              color: Colors.white,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        (this.showPassword == false) ?

                        // Confirmar senha
                        TextFormField(
                          controller: _confirmInputController,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Confirme a Senha",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key_sharp,
                              color: Colors.white,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ) : Container(),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Color.fromRGBO(211, 111, 47, 100),
                              
                              value: this.showPassword, onChanged: (Value){
                              setState(() {
                                this.showPassword = Value;
                              });
                            }),
                            new Text('Mostrar senha',
                            style: TextStyle(color: Colors.white),)
                          ],
                        ),

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
                                      onPressed: () {},
                                      child: new Text('Cadastrar')),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }

  Container campTexto(String title, final controller) {
    return new Container(
        margin: EdgeInsets.only(bottom: 10),
        child: new TextField(
          keyboardType: TextInputType.text,
          controller: controller,
          decoration: InputDecoration(
            labelText: title,
            labelStyle: TextStyle(fontSize: 18),
            // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey) ),
          ),
        ));
  }
}
