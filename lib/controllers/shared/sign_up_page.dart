import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/controllers/shared/preferences_keys.dart';
import 'package:teste/controllers/shared/sign_up_service.dart';

import '../../models/login_model.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  bool? continueConnected = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 50,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(211, 111, 47, 100), Colors.white],
              ),
            ),
            child: SingleChildScrollView(
              child: Stack(children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 7),
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 25,
                                  spreadRadius: 0.1)
                            ]),
                        child: Image.asset(
                          'assets/imgs/logo_app.png',
                          fit: BoxFit.fitHeight,
                          // width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Cadastro",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value!.length < 10) {
                                      return "Digite um nome maior";
                                    }
                                    return null;
                                  },
                                  controller: _nameInputController,
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
                                  validator: (value) {
                                    if (value!.length < 5) {
                                      return "Esse e-mail parece curto demais";
                                    } else if (value.contains("@")) {
                                      return "Esse e-mail está meio estranho, não?";
                                    }
                                    return null;
                                  },
                                  controller: _mailInputController,
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
                                  validator: (value) {
                                    if (value!.length < 6) {
                                      return "A senha deve ter pelo menos 6 caracteres";
                                    }
                                    return null;
                                  },
                                  controller: _passwordInputController,
                                  obscureText: (this.continueConnected == true)
                                      ? false
                                      : true,
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
                                (this.continueConnected == false)
                                    ? TextFormField(
                                        validator: (value) {
                                          if (value !=
                                              _passwordInputController.text) {
                                            return "As senhas devem ser iguais";
                                          }
                                          return null;
                                        },
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
                                        activeColor:
                                            Color.fromRGBO(211, 111, 47, 100),
                                        value: this.continueConnected,
                                        onChanged: (newValue) {
                                          setState(() {
                                            this.continueConnected = newValue;
                                          });
                                        }),
                                    new Text('Mostrar senha')
                                  ],
                                )
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            onPressed: () {
                              _doSignUp();
                            },
                            child: Text("Casdastrar"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            )));
  }

  void _doSignUp() {
    if (_formKey.currentState!.validate()) {
      SignUpService().signUp(
        _mailInputController.text,
        _passwordInputController.text,
      );
    } else {
      print("invalido");
    }

    // LoginModel newUser = LoginModel(
    //   name: _nameInputController.text,
    //   mail: _mailInputController.text,
    //   password: _passwordInputController.text,
    //   keepOn: true,
    // );

    // _saveUser(newUser);
  }

  // ignore: unused_element
  void _saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKeys.activeUser,
      json.encode(user.toJson()),
    );
  }
}
