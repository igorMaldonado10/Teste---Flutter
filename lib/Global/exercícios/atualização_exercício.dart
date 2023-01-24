import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicios_list.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';

import 'Chips/list_of_chips.dart';
import 'Toggle Buttons/toggleButtons1.dart';

class ExerciseForm extends StatefulWidget {
  final int? id;
  // final Treino_dois? treino;
  final Exercises? exercises;
  // Construtor com o atributo obrigatório (id)
  ExerciseForm({this.id, this.exercises});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  // const TreinoForm2({Key? key}) : super(key: key);
  final nameExercisesController = TextEditingController();
  final obsController = TextEditingController();
  final numSer = TextEditingController();
  final numReps = TextEditingController();
  final restTime = TextEditingController();
  final grupoMuscController = TextEditingController();

  // // Objeto de classe que contém a Busca dos contatos
  // final TreinoService treinoService = new TreinoService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameExercisesController.text = widget.exercises!.name!;
    obsController.text = widget.exercises!.obs!;
    numSer.text = widget.exercises!.numSeries!.toString();
    numReps.text = widget.exercises!.numRepeti!.toString();
    restTime.text = widget.exercises!.restTime!;
    grupoMuscController.text = widget.exercises!.grupoMusc!;
  }

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Treino
    // Treino_dois treino = treinoService.listarTreinos().elementAt(widget.id - 1);

    return Scaffold(
      appBar: appaBarHome(Text('Editar' + ' - ' '${widget.exercises!.name!}')),
      body: SingleChildScrollView(
        child: Padding(
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
                          'Editar Exercício',
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
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       labelText: 'Grupo muscular',
                    //       hintText: widget.exercises!.grupoMusc!),
                    //   controller: grupoMuscController,
                    // ),
                    SizedBox(height: 30),

                    Container(
                      padding: EdgeInsets.only(right: 230),
                      child: Text('Grupo muscular'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListOfChips(
                        onSelectedChange: (String value) {
                          grupoMuscController.text = value;
                        },
                        items: [
                          'Toráx',
                          'Abdômen',
                          'Costas',
                          'Ombros',
                          'Peito',
                          'Bíceps',
                          'Tríceps',
                          'Lombar',
                          'Quadríceps',
                          'Posterior coxa',
                          'Gêmeos'
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(right: 230),
                      child: Text('Tipo de exercício'),
                    ),

                    SizedBox(height: 30),

                    ToggleButtons1(),

                    Padding(padding: EdgeInsets.all(10)),

                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Número de séries',
                          hintText: widget.exercises?.numSeries!.toString()),
                      controller: numSer,
                    ),

                    Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),

                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Número de repetições',
                          hintText: widget.exercises?.numRepeti!.toString()),
                      controller: numSer,
                    ),

                    Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),

                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Tempo de descanso(minutos)',
                          hintText: widget.exercises?.restTime),
                      controller: restTime,
                    ),

                    Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),

                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Observação',
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
                            widget.exercises?.name =
                                nameExercisesController.text;
                            widget.exercises?.grupoMusc =
                                grupoMuscController.text;
                            widget.exercises?.obs = obsController.text;

                            Navigator.pop(context);

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ExercisesList()));
                          });
                        },
                        child: new Text('Confirmar')),
                  ],
                ),
              )
            ],
          ),
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
