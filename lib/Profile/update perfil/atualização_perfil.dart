import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teste/Profile/update%20perfil/editar_perfil.dart';
import 'package:teste/Profile/model/perfil_model.dart';
import 'package:teste/Profile/perfil_page.dart';
import 'package:teste/Profile/perfil_service.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';

class AtualizarPerfil extends StatefulWidget {
  final int id = 0;

  // // Construtor com o atributo obrigatório (id)
  // AtualizarPerfil({required this.id});

  @override
  State<AtualizarPerfil> createState() => _AtualizarPerfilState();
}

class _AtualizarPerfilState extends State<AtualizarPerfil> {
  // const TreinoForm2({Key? key}) : super(key: key);
  
  TextEditingController iconController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoAtualController = TextEditingController();
  TextEditingController nasciController = TextEditingController();
  TextEditingController textBioController = TextEditingController();

  // // Objeto de classe que contém a Busca do perfil
  final PerfilService perfilService = new PerfilService();

  // XFile? foto;


  @override
  Widget build(BuildContext context) {
    // Objeto da classe Perfil
    User user = perfilService.listaUser().elementAt(widget.id);


    return Scaffold(
      appBar: appaBarHome(Text('Editar' + ' - ' '${user.name}')),
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
                        InputDecoration(labelText: 'ícone',),
                    controller: iconController,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Nome', hintText: user.name),
                    controller: nomeController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'data de nascimento',
                        hintText: user.dataNasc),
                    controller: nasciController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Peso atual', hintText: user.pesoAtual),
                    controller: pesoAtualController,
                  ),
                   TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Bio', hintText: user.pesoAtual),
                    controller: textBioController,
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
                          user.dataNasc = nasciController.text;
                          user.pesoAtual = pesoAtualController.text;
                          user.textBio = textBioController.text;

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
