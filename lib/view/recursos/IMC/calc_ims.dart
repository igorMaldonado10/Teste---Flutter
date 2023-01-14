import 'dart:async';
import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';
import 'package:flutter/src/widgets/container.dart';

class CalculadoraIMC extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CalculadoraIMC> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  late String _result;

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    _pesoController.text = '';
    _alturaController.text = '';
    setState(() {
      _result = 'Informe seus dados';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appaBar(Text('Calculadora IMC')),
        drawer: MenuDrawer(),
        body: Container(
          height: MediaQuery.of(context).size.height ,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Theme.of(context).primaryColorLight, Theme.of(context).canvasColor])),
          child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0), child: buildForm()),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
      BottomNavigationBarItem(
                label: 'Home',
                icon: new IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => HomePage())));
                    },
                    icon: new FaIcon(FontAwesomeIcons.houseChimney))),

            BottomNavigationBarItem(
                label: 'Perfil',
                icon: new IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.solidCircleUser)))
    ]
    ),
        );
        
  }

  AppBar appaBar(Text texto) {
    return AppBar(
        automaticallyImplyLeading: false, //Esconde o ícone original (menu)

        centerTitle: true,
        title: texto,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              resetFields();
            },
          )
        ],
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: FaIcon(FontAwesomeIcons.bars),
              onPressed: () => Scaffold.of(context).openDrawer());
        }));
  }

// Método que retorno o formulário
  Form buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildTextFormField(
              label: "Peso (kg)",
              error: "Insira seu peso!",
              controller: _pesoController),
          buildTextFormField(
              label: "Altura (cm)",
              error: "Insira uma altura!",
              controller: _alturaController),
          buildTextResult(),
          buildCalculateButton(),
        ],
      ),
    );
  }

  void calculateImc() {
    double peso = double.parse(_pesoController.text);
    double altura = double.parse(_alturaController.text) / 100.0;
    double imc = peso / (altura * altura);

    setState(() {
      _result = "IMC = ${imc.toStringAsPrecision(2)}\n";
      if (imc < 18.6) {
        _result += "Abaixo do peso";
      } else if (imc < 25.0) {
        FaIcon(
          FontAwesomeIcons.smile,
          size: 100,
        );
        _result += "Peso ideal";
      } else if (imc < 30.0) {
        _result += "Levemente acima do peso";
      } else if (imc < 35.0) {
        _result += "Obesidade Grau I";
      } else if (imc < 40.0) {
        _result += "Obesidade Grau II";
      } else {
        _result += "Obesidade Grau IIII";
      }
    });
  }

  Widget buildCalculateButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            calculateImc();
          }
        },
        child: Text('CALCULAR'),
      ),
    );
  }

  Widget buildTextResult() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(020),
        color: Colors.orange.shade200,
        boxShadow: [
          BoxShadow(
              color: Colors.black45,
                              blurRadius: 15,
                              spreadRadius: 0.1
          )
        ]
  ),
        // color: Colors.orange.shade100,
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _result,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.only(top: 10))
          ],
        ),
      ),
    );
  }
  

// Método que retorna os campos de texto
  Widget buildTextFormField(
      {TextEditingController? controller, String? error, String? label}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      controller: controller,
      validator: (text) {
        return text!.isEmpty ? error : null;
      },
    );
  }
}
