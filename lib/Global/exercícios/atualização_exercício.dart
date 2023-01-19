import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicios_list.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';

class ExerciseForm extends StatefulWidget {
  // final int? id;
  final Treino_dois? treino;
  final Exercises? exercises;
  // Construtor com o atributo obrigatório (id)
  ExerciseForm({this.treino, this.exercises});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  // const TreinoForm2({Key? key}) : super(key: key);
  TextEditingController nameExercisesController = TextEditingController();

  TextEditingController obsController = TextEditingController();

  TextEditingController grupoMuscController = TextEditingController();

  // // Objeto de classe que contém a Busca dos contatos
  // final TreinoService treinoService = new TreinoService();

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Treino
    // Treino_dois treino = treinoService.listarTreinos().elementAt(widget.id - 1);

    return Scaffold(
      appBar: appaBarHome(Text('Editar' + ' - ' '${widget.exercises!.name!}')),
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
                        labelText: 'Nome do treino',
                        hintText: widget.exercises?.name!),
                    controller: nameExercisesController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Grupo muscular',
                        hintText: widget.exercises!.grupoMusc!),
                    controller: grupoMuscController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Validade do treino',
                        hintText: widget.exercises!.obs!),
                    controller: obsController,
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
                          widget.exercises?.name = nameExercisesController.text;
                          widget.exercises?.grupoMusc =
                              grupoMuscController.text;
                          widget.exercises?.obs = obsController.text;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExercisesList(widget.treino)));
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
