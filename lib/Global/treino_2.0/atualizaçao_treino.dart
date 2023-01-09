import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/treino_2.0/treino_list2.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';

class TreinoForm2 extends StatefulWidget {
  final int id;

  // Construtor com o atributo obrigatório (id)
  TreinoForm2({required this.id});

  @override
  State<TreinoForm2> createState() => _TreinoForm2State();
}

class _TreinoForm2State extends State<TreinoForm2> {
  // const TreinoForm2({Key? key}) : super(key: key);
  TextEditingController tipoDeTreinoController = TextEditingController();

  TextEditingController dataDoTreinoController = TextEditingController();

  TextEditingController objetivoController = TextEditingController();

  // // Objeto de classe que contém a Busca dos contatos
  final TreinoService treinoService = new TreinoService();

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Treino
    Treino_dois treino = treinoService.listarTreinos().elementAt(widget.id -1);

    return Scaffold(
      appBar: appaBarHome(Text('Editar' + ' - ' '${treino.tipoDeTreino}')),
      body: Padding(
        padding: EdgeInsets.all(
          15,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  //  Nome do treino
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Editar treino',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Tipo de treino',
                      hintText: treino.tipoDeTreino),
                    
                    controller: tipoDeTreinoController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Objetivo',
                      hintText: treino.objetivo
                      ),
                    controller: objetivoController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Validade do treino',
                    hintText: treino.dataDoTreino
                    ),
                    controller: dataDoTreinoController,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          treino.tipoDeTreino = tipoDeTreinoController.text;
                          treino.objetivo = objetivoController.text;
                          treino.dataDoTreino = dataDoTreinoController.text;

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TreinoList2()));
                        });
                      },
                      child: new Text('Confirmar')),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: barraInferior(),
    );
  }

  // void atualizarList() {
  //   // Treino_dois treino = treinoService.listarTreinos().elementAt(id - 1);
  //   setState(() {});
  //   treino.tipoDeTreino = tipoDeTreinoController.text;
  //   // treino.objetivo = objetivoController.text;
  //   // String tipoDeTreino = tipoDeTreinoController.text;
  //   String objetivo = tipoDeTreinoController.text;
  //   String data = dataDoTreinoController.text;

  //   // treinoService.listarTreinos().elementAt(id);
  // }

  AppBar appaBarHome(Text texto) {
    return AppBar(
        automaticallyImplyLeading: false, //Esconde o ícone original (menu)

        centerTitle: true,
        title: texto,
        //  actions: [
        //   Switch(
        //       value: tema.value == ThemeMode.dark,
        //       onChanged: (isDark) {
        //         setState(() {
        //                 tema.value = isDark ? ThemeMode.dark : ThemeMode.light;
        //         });
        //       })
        // ],
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: FaIcon(FontAwesomeIcons.bars),
              onPressed: () => Scaffold.of(context).openDrawer());
        }
        )
        );
  }

  BottomNavigationBar barraInferior(){
    return BottomNavigationBar(items: [
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
    );
  }
}
