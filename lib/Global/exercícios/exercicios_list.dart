import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:teste/Global/exerc%C3%ADcios/cadastro_exercicio.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicio_item.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/exerc%C3%ADcios/searchPageExercises.dart';
import 'package:teste/Global/treino_1.0/treino_list.dart';
import 'package:teste/Global/treino_2.0/historico_service.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExercisesList extends StatefulWidget {
  /// Guardar a ID do treino selecionado
  /// final int id;
  final Treino_dois? treino;

  /// final int? id;
  ///
  /// Guardar a ID do treino selecionado
  /// Construtor com o atributo (id)
  ExercisesList(this.treino);

  @override
  State<ExercisesList> createState() => _ExercisesListState();
}

class _ExercisesListState extends State<ExercisesList> {
  // Lógica do cronometro de execução de treino
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  double percent = 0.0;
  Timer? timer;
  bool started = false;
  List? marcas = [];

  // List? tempo = marcas;

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";
    });
  }

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  // Função para startar o timer
  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
      });
    });
  }

  // _startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       hours += 1;
  //       if (hours <= 60) {
  //         timer.cancel();
  //         // percent = 0.0;
  //       }
  //     });
  //   });
  // }

  void addTempoTreino() {
    HistoricoService historicoService = new HistoricoService();
    String tempoDeTreino = "$digitHours:$digitMinutes:$digitSeconds";   

     setState(() {
      historicoService.addTempoDeTreino(widget.treino!, tempoDeTreino);
  });

    // marcas?.add(tempoDeTreino);
  }

  void executarTreino() {
    HistoricoService historicoService = new HistoricoService();

   String tempoDeTreino = "$digitHours:$digitMinutes:$digitSeconds";  
    // Guardar o último ID cadastrado
    int ultimoID = historicoService.listarTreinosExecut().length;

    Treino_dois treino_dois = Treino_dois(
      id: ultimoID + 1,
      tipoDeTreino: widget.treino?.tipoDeTreino,
      dataDoTreino: widget.treino?.dataDoTreino,
      objetivo: widget.treino?.objetivo,
      marca: tempoDeTreino
    );


// Envia o treino (objeto) realizado para adicionar na lista de histórico
    String mensagem = historicoService.executarTreino(
      treino_dois,
    
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(mensagem),
        ],
      ),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    ));

    // Redireciona para a tela de busca
    // Future.delayed(Duration(milliseconds: 2500), () {
    //   Navigator.pop(context);
    //   // Navigator.push(
    //   //     context, MaterialPageRoute(builder: (context) => TreinoList2()));
    // });
  }

  // Objeto do model
  // TreinoService treinoService = new TreinoService();

// Objeto que busca o arquivo exercicio que retorna a simulação de banco de dados;
  bool? exerCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Exercícios' + ' - ' '${widget.treino!.tipoDeTreino}'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SearchPageExerc(
                                    treino: widget.treino,
                                  )
                              // treinoService.searchPage()

                              )));
                },
                icon: Icon(Icons.search))
          ]),
      //  appaBarHome(
      //     Text('Exercícios' + ' - ' '${widget.treino!.tipoDeTreino}')),
      // drawer: MenuDrawer(),
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(4, 8, 4, 75),
          itemCount: widget.treino?.listExercises?.length ?? 0,
          // recebo o índice e o contexto do elemento que vou retornar;
          itemBuilder: (BuildContext context, int index) {
         
            int _numInicial = 0;

            return ListExerciseItem(
              exercises: widget.treino!.listExercises![index],
              treino: widget.treino,
            );
          }),

      persistentFooterButtons: [
        // SizedBox(height:30),
        Container(
          child: (widget.treino!.listExercises!.length == null ||
                  widget.treino!.listExercises!.isEmpty ||
                  widget.treino!.listExercises!.length < 2)
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          executarTreino();
                          Future.delayed(Duration(seconds: 1), () {
                            reset();
                          });
                        },
                        icon: Icon(Icons.square)),
                    (!started == true)
                        ? IconButton(
                            iconSize: 40.0,
                            onPressed: () {
                              start();
                            },
                            icon: Icon(Icons.play_arrow))
                        : IconButton(
                            iconSize: 40.0,
                            onPressed: () {
                              stop();
                            },
                            icon: Icon(Icons.pause)),
                    SizedBox(width: 40),
                    Text(
                      // '$percent',
                      '$digitHours:$digitMinutes:$digitSeconds',
                      style: TextStyle(
                          // color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
        ),
        SizedBox(
          height: 30,
        )
      ],
      floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.plus),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastroExercicio(
                          treino: widget.treino,
                        )));
          }),
    );
  }

  AppBar appaBarHome(Text texto) {
    return AppBar(
        automaticallyImplyLeading: false, //Esconde o ícone original (menu)

        centerTitle: true,
        title: texto,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SearchPageExerc(
                                  treino: widget.treino,
                                )
                            // treinoService.searchPage()

                            )));
              },
              icon: Icon(Icons.search))
        ]);
  }
  // leading: Builder(builder: (BuildContext context) {
  //   return IconButton(
  //       icon: FaIcon(FontAwesomeIcons.bars),
  //       onPressed: () => Scaffold.of(context).openDrawer());
  // }
  // )
}
