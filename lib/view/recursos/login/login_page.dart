import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/controllers/shared/preferences_keys.dart';
import 'package:teste/view/recursos/login/login_model.dart';
import 'package:teste/view/recursos/login/cadatroUsuario.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController senhaInputController = TextEditingController();

  bool? ocultSenha = false;
  final _formKey = GlobalKey<FormState>();

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
                              color: Color.fromARGB(115, 168, 73, 73),
                              blurRadius: 25,
                              spreadRadius: 0.1)
                        ]),
                    child: Image.asset(
                      'assets/imgs/logo_app.png',
                      fit: BoxFit.fitHeight,
                      // width: MediaQuery.of(context).size.width,
                    ),
                  ),

                  // Campos de texto
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.length < 5) {
                                return 'Esse e-mail parece curto demais';
                              } else if (!value.contains('@')) {
                                return 'Esse e-mail está meio estranho, não?';
                              }
                              return null;
                            },
                            controller: emailInputController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail_outline),
                                hintText: 'nome@email.com',
                                labelText: 'Login',
                                border: OutlineInputBorder()),
                            // Como ele tem a mesma assinatura de função da para usar nos dois onChanged(ex.: _setSenha)
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'A senha deve ter no mínimo 6 caracteres';
                              }
                              return null;
                            },
                            controller: senhaInputController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.key),
                              hintText: 'exemplo: 1234',
                              label: Text('Senha'),
                              border: OutlineInputBorder(),
                            ),
                            obscureText:
                                (this.ocultSenha == true) ? false : true,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor:
                                      Color.fromRGBO(211, 111, 47, 100),
                                  value: this.ocultSenha,
                                  onChanged: (newValue) {
                                    setState(() {
                                      this.ocultSenha = newValue;
                                    });
                                  }),
                              new Text('Mostrar senha')
                            ],
                          )
                        ],
                      ),
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

    if (_formKey.currentState!.validate() && emailForm == savedUser.email && senhaForm == savedUser.senha) {
      // print('Válido');
         ScaffoldMessenger.of(context)
          .showSnackBar(PlusSnack('Sucesso\n' 'Seja bem-vindo'));

      Future.delayed(Duration(seconds: 3))
          .then((_) => Navigator.of(context).pushReplacementNamed('/home'));

      Navigator.pushReplacementNamed(context, '/home');

    } else {
      // print('inválido');
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
