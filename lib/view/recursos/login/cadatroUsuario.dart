import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/controllers/shared/preferences_keys.dart';
import 'package:teste/view/recursos/login/login_model.dart';
import 'package:teste/view/recursos/login/login_page.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({Key? key}) : super(key: key);

  @override
  State<CadastroUser> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  bool? showPassword = false;

  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _senhaInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  LoginModel get usuario => usuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
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

                        TextFormField(
                          validator: (value) {
                            if (value!.length < 5) {
                              return 'Esse e-mail parece curto demais';
                            } else if (!value.contains('@')) {
                              return 'Esse e-mail está meio estranho, não?';
                            }
                            return null;
                          },
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

                        // Campo de text(Senha)
                        TextFormField(
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'A senha deve conter no mínimo 6 caractéres';
                            } else {
                              return null;
                            }
                          },
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

                            // Campo de text de confirmar senha
                            TextFormField(
                                validator: (value) {
                                  if (value != _senhaInputController.text) {
                                    return 'Informe senha iguais nos campos de texto';
                                  } else {
                                    return null;
                                  }
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
                          child: Divider(
                            height: 50,
                            color: Colors.white,
                          ),
                        ),


                        //------Botões------

                        // ignore: unnecessary_new
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Botão Cadastrar
                           
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
  
    if (_formKey.currentState!.validate()) {
      LoginModel newUser = LoginModel(
          email: _emailInputController.text,
          senha: _senhaInputController.text,
          // Varíavel de continuar
          keep0n: true);

      print(newUser);

      _saveUser(newUser);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Usuario cadastrado com sucesso'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3)));

      Future.delayed(Duration(seconds: 3)).then((value) =>
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage())));
    } else {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Falha na realização do cadastro'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3)));
    }
  }
}

// Para gravarmos ela deve ser uma função async pois como é um processo demorado a programação deve esperar para só após isso, continue a execução do programa
void _saveUser(LoginModel usuario) async {
  // Resgatar essas preferências
  // getInstance = utilizando uma intância do SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // encode = pega um objeto que é do tipo Map e tranforma o json em String
  prefs.setString(PreferencesKeys.activeUser, jsonEncode(usuario.toJson()));
}
