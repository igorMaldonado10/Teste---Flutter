import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
        appBar: AppBar(
        centerTitle: true,
        title: Text('Calculadora IMC'),
        actions: [
        IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              resetFields();
            },
          )
        ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height ,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Theme.of(context).backgroundColor.withOpacity(.3),Theme.of(context).canvasColor])),
          child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0), child: buildForm()),
        ),

        );
        
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
