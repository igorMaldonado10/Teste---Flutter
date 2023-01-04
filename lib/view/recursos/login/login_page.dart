import 'dart:async';
import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:teste/controllers/login_controller.dart';
import 'package:teste/controllers/shared/preferences_keys.dart';
import 'package:teste/models/login_model.dart';
import 'package:teste/view/recursos/login/cadatroUsuario.dart';

// import '../../../models/usuários.dart';



class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController senhaInputController = TextEditingController();

  bool? continueConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(47, 84, 115, 100),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(211, 111, 47, 100), Colors.white])),
        child: SingleChildScrollView(
            child: Stack(
          children: [
            // Imagem do logo com o BoxDecoration
        
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
                              spreadRadius: 0.1
                              )
                        ]),
                    child: Image.asset(
                      'assets/imgs/logo_app.png',
                       fit: BoxFit.fitHeight,
                      // width: MediaQuery.of(context).size.width,
                    ),
                  ),

                  // Campos de texto
                  Container(
                    padding: EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          controller: emailInputController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail_outline),
                              hintText: 'nome@email.com',
                              labelText: 'Login',
                              border: OutlineInputBorder()),
                          // Como ele tem a mesma assinatura de função da para usar nos dois onChanged(ex.: _setSenha)
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: senhaInputController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            hintText: 'exemplo: 1234',
                            label: Text('Senha'),
                            border: OutlineInputBorder(),
                          ),
                          obscureText:
                              (this.continueConnected == true) ? false : true,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                activeColor: Color.fromRGBO(211, 111, 47, 100),
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
                  SizedBox(height: 5),
                  Container(
                    width: 320,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // ValueListenableBuilder<bool>(
                        //     valueListenable: _controller.loading,
                        //     builder: (_, loading, __) => loading
                        //         ? Column(
                        //             children: [
                        //               CircularProgressIndicator(),
                        //             ],
                        //           )
                        //         : )
                        ElevatedButton(
                            onPressed: () {
                              _fazerLogin();
                              //then : pega o valor da varíavel interpolada
                              // _controller.auth().then((result) {
                              //   if (result) {
                              //     Navigator.of(context)
                              //         .pushReplacementNamed('/home');
                              //     PlusSnack(
                              //         'Sucesso!\n seja bem-vindo!');
                              //   } else {
                              //     ScaffoldMessenger.of(context)
                              //         .showSnackBar(PlusSnack('Falha\n'
                              //             'Insira os dados novamente'));
                              //   }
                              // });
                            },
                            child: new Text('Entrar')),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Text(
                                'ou',
                                style: TextStyle(fontSize: 15),
                              )
                            ]),
                        Container(
                          width: 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CadastroUser()));
                                  },
                                  child: new Text('Cadastrar-se')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  void _fazerLogin() async {
    String emailForm = this.emailInputController.text;
    String senhaForm = this.senhaInputController.text;

    LoginModel savedUser = await _getSavedUser();

    if (emailForm == savedUser.email && senhaForm == savedUser.senha) {
      

      ScaffoldMessenger.of(context)
          .showSnackBar(PlusSnack('Sucesso\n' 'Seja bem-vindo'));

      // Navigator.push(
      //     context, MaterialPageRoute(builder: ((context) => HomeScreen())));
      Future.delayed(Duration(seconds: 3))
          .then((_) => Navigator.of(context).pushReplacementNamed('/home'));

      // Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(PlusSnack('Falha\n' 'Insira os dados novamente'));
    }
  }

  Future<LoginModel> _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString(PreferencesKeys.activeUser);
    print(jsonUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    LoginModel usuario = LoginModel.fromJson(mapUser);
    return usuario;
  }

  SnackBar PlusSnack(String texto1) {
    return SnackBar(
        content: new Text(
      texto1,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    ));
  }
}
