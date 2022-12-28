import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/controllers/login_controller.dart';
import 'package:teste/view/cadatroUsuario.dart';
import 'package:teste/controllers/usu%C3%A1rios.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _controller = LoginController();

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
                              spreadRadius: 0.1)
                        ]),
                    child: Image.asset(
                      'assets/imgs/logo_app.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),

                  // Campos de texto
                  Container(
                    padding: EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail_outline),
                              hintText: 'nome@email.com',
                              labelText: 'Login',
                              border: OutlineInputBorder()),
                          // Como ele tem a mesma assinatura de função da para usar nos dois onChanged(ex.: _setSenha)
                          onChanged: _controller.setLogin,
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                              
                              prefixIcon: Icon(Icons.key),
                              hintText: 'exemplo: 1234',
                              label: Text('Senha'),
                              border: OutlineInputBorder(),
                              ),
                          obscureText: true,
                          onChanged: _controller.setSenha,
                          
                          
                          
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
                                })
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
                        ValueListenableBuilder<bool>(
                            valueListenable: _controller.loading,
                            builder: (_, loading, __) => loading
                                ? Column(
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      //then : pega o valor da varíavel interpolada
                                      _controller.auth().then((result) {
                                        if (result) {
                                          Navigator.of(context)
                                              .pushReplacementNamed('/home');
                                          PlusSnack(
                                              'Sucesso!\n seja bem-vindo!');
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(PlusSnack('Falha\n'
                                                  'Insira os dados novamente'));
                                        }
                                      });
                                    },
                                    child: new Text('Entrar'))),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Text(
                                'ou',
                                style: TextStyle(fontSize: 20),
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

  SnackBar PlusSnack(String texto1) {
    return SnackBar(
        content: new Text(
      texto1,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey.shade300),
    ));
  }
}
