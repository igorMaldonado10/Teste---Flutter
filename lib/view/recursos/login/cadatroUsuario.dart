import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/controllers/shared/preferences_keys.dart';
import 'package:teste/controllers/shared/sign_up_service.dart';
import 'package:teste/models/login_model.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({Key? key}) : super(key: key);

  @override
  State<CadastroUser> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  bool? showPassword = false;

  // TextEditingController _nomeInputController = TextEditingController();
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _senhaInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  LoginModel get usuario => usuario;

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
                    key: _formKey,
                    child: Column(
                      children: [
                        // TextFormField(
                        //   controller: _nomeInputController,
                        //   autofocus: true,
                        //   style: TextStyle(color: Colors.white),
                        //   decoration: InputDecoration(
                        //     labelText: "Nome Completo",
                        //     labelStyle: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //     prefixIcon: Icon(
                        //       Icons.person,
                        //       color: Colors.white,
                        //     ),
                        //     focusedBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),

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
                          obscureText:
                              (this.showPassword == true) ? false : true,
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
                        (this.showPassword == false)
                            ?

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
                              )
                            : Container(),
                        Row(
                          children: [
                            Checkbox(
                                activeColor: Color.fromRGBO(211, 111, 47, 100),
                                value: this.showPassword,
                                onChanged: (Value) {
                                  setState(() {
                                    this.showPassword = Value;
                                  });
                                }),
                            new Text(
                              'Mostrar senha',
                              style: TextStyle(color: Colors.white),
                            )
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
                                      onPressed: () {
                                        _doSignUp();
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
                ],
              ),
            ))));
  }

  void _doSignUp() {
    // if (_formKey.currentState!.validate()) {
    //   SignUpService()
    //       .signUp(_emailInputController.text, _senhaInputController.text);
    // } else {
    //   print('invalido');
    // }
    // .text no controller me da o texto atual
    LoginModel newUser = LoginModel(
        // name: _nomeInputController.text,
        email: _emailInputController.text,
        senha: _senhaInputController.text,
        keep0n: true);

    print(newUser);
    _saveUser(newUser);
  }
}

// Para gravarmos ela deve ser uma função async pois como é um processo demorado a programação pode continuar acontecendo
void _saveUser(LoginModel usuario) async {
  // Resgatar essas preferências
  // getInstance = utilizando uma intância do SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // encode = pega um objeto que é do tipo Map e tranforma o json em String
  prefs.setString(PreferencesKeys.activeUser, jsonEncode(usuario.toJson()));
}
