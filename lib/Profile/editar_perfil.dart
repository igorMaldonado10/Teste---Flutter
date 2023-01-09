import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Profile/perfil_model.dart';
import 'package:teste/Profile/perfil_page.dart';
import 'package:teste/Profile/perfil_service.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';

class PerfilForm extends StatefulWidget {
  final int id;

  // Construtor com o atributo obrigatório (id)
  PerfilForm({required this.id});

  @override
  State<PerfilForm> createState() => _PerfilFormState();
}

class _PerfilFormState extends State<PerfilForm> {
  // const TreinoForm2({Key? key}) : super(key: key);
  TextEditingController nomeController = TextEditingController();

  TextEditingController pesoAtualController = TextEditingController();

  TextEditingController dataNascController = TextEditingController();

  TextEditingController iconController = TextEditingController();

  // // Objeto de classe que contém a Busca dos contatos
  final PerfilService perfilService = new PerfilService();

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Treino
    User user = perfilService.listaUser().elementAt(widget.id - 1);

    return Scaffold(
      appBar: appaBarHome(Text('Perfil')),
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
                    decoration:
                        InputDecoration(labelText: 'nome', hintText: user.name),
                    controller: nomeController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Data de nascimento',
                        hintText: user.dataNasc),
                    controller: dataNascController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Peso', hintText: user.pesoAtual),
                    controller: pesoAtualController,
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
                          user.name = nomeController.text;
                          user.dataNasc = dataNascController.text;
                          user.pesoAtual = pesoAtualController.text;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PerfilPage()));
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
        }));
  }

  BottomNavigationBar barraInferior() {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
          label: 'Home',
          icon: new IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePage())));
              },
              icon: new FaIcon(FontAwesomeIcons.houseChimney))),
      BottomNavigationBarItem(
          label: 'Perfil',
          icon: new IconButton(
              onPressed: () {}, icon: FaIcon(FontAwesomeIcons.solidCircleUser)))
    ]);
  }
}
