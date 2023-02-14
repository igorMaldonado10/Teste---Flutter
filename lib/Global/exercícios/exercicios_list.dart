import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:teste/Global/exerc%C3%ADcios/cadastro_exercicio.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicio_item.dart';
import 'package:teste/Global/exerc%C3%ADcios/searchPageExercises.dart';
import 'package:teste/Global/treino_2.0/historico_pages/historico_service.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';

class ExercisesList extends StatefulWidget {
  final Treino_dois? treino;

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
  int execucoes = 0;

// Método para resetar o cronômetro de execução
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

// Método para pausar o cronômetro de execução
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  // Função para startar o cronômetro de execução
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

// Método para incrementar o número de execuções em cada treino executado
  void numExecucoes() {
    if (execucoes < 90) {
      widget.treino?.execucoesDeTreino =
          execucoes += 1; 

      widget.treino?.listExecucoes?.add(widget.treino?.execucoesDeTreino ??
          0); 
    } else {
      
      widget.treino?.listExecucoes
          ?.length; 

    }
  }

  // Método para executar treino
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
      marca: tempoDeTreino,
    );

// Envia o treino (objeto) realizado para adicionar na lista de histórico
    String mensagem = historicoService.executarTreino(
      treino_dois,
    );

    Get.rawSnackbar(
        title: 'Sucesso!',
        message: mensagem,
        duration: Duration(milliseconds: 2500),
        snackPosition: SnackPosition.TOP,
        showProgressIndicator: true);

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text(mensagem),
    //     ],
    //   ),
    //   duration: Duration(seconds: 3),
    //   // behavior: SnackBarBehavior.floating,
    // ));
  }

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
                          builder: ((context) => 
                          SearchPageExerc(
                                    treino: widget.treino,
                                  )
                              )));
                },
                icon: Icon(Icons.search))
          ]),

      body: Consumer<TreinoService>(
        builder: (context, repositorioTreinos, child) {
          return ListView.builder(
              padding: EdgeInsets.fromLTRB(4, 8, 4, 75),
              itemCount: widget.treino?.listExercises?.length ?? 0,

              // recebo o índice e o contexto do elemento que vou retornar;
              itemBuilder: (BuildContext context, int index) {
                return ListExerciseItem(
                  exercises: widget.treino!.listExercises![index],
                  treino: widget.treino,
                );
              });
        },
      ),
      persistentFooterButtons: [
        
        Consumer<TreinoService>(
          builder: (BuildContext context, repositorioTreinos, Widget? child) {
            return Container(
              child: (widget.treino!.listExercises!.length == null ||
                      widget.treino!.listExercises!.isEmpty ||
                      widget.treino!.listExercises!.length < 2)
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.topSlide,
                                showCloseIcon: true,
                                title: 'Certeza?',
                                desc: 'Você deseja executar esse treino?',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                 
                                  executarTreino();

                                  Future.delayed(Duration(seconds: 1), () {
                                    reset();
                                  });

                                  numExecucoes();
                                  print(
                                      '${widget.treino?.tipoDeTreino} foi executado: ${widget.treino!.execucoesDeTreino}'
                                      );
                                },
                              ).show();
                            },
                            icon: Icon(Icons.square)),
                        
                        // If ternário para comandar os botões de start e pause
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
                          '$digitHours:$digitMinutes:$digitSeconds',
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
            );
          },
        ),
        SizedBox(
          height: 30,
        )
      ],
      floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.plus),
          onPressed: () {
            Get.to(CadastroExercicio(treino: widget.treino),
                fullscreenDialog: true);
          }),
    );
  }

  // _openExerciseFormModal(BuildContext context) {
  //   showModalBottomSheet(
  //       elevation: 20,
  //       context: context,
  //       builder: ((context) {
  //         return CadastroExercicio(
  //           treino: widget.treino,
  //         );
  //       }));
  //   // Fechar Modal
  // }

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
