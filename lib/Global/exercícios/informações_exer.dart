import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:teste/Global/exerc%C3%ADcios/atualiza%C3%A7%C3%A3o_exerc%C3%ADcio.dart';
import 'package:teste/Global/exerc%C3%ADcios/cadastro_exercicio.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicios_list.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';

import 'Toggle Buttons/class_GetX_bool_for_string.dart';

class InfoExercises extends StatefulWidget {
  // const EditTreino({Key? key}) : super(key: key);

  // Guardar o ID do Exercício selecionado
  final int? id;
  final Treino_dois treino;
  final Exercises? exercises;

  // Construtor com o atributo obrigatório (id)
  InfoExercises({required this.treino, this.exercises, this.id});

  @override
  State<InfoExercises> createState() => _InfoExercisesState();
}

class _InfoExercisesState extends State<InfoExercises> {
  // Objeto de classe que contém a Busca dos contatos
  final TreinoService treinoService = new TreinoService();

  bool? exerCheck = false;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<Controller>();

    // widget.exercises?.tipo = controller.tipoExerc;
    // Objeto que busca o arquivo treino que retorna a simulação de banco de dados e faz a listagem por id;

    // Objeto da classe Treino
    // Treino_dois treino = treinoService.listarTreinos().elementAt(widget.id - 1);

    return Scaffold(
      // Barra de título
      appBar: AppBar(
        centerTitle: true,
        title: Text('Informações'),
      ),
      // Menu (Hambúrguer)
      // drawer: MenuDrawer(),

      // Corpo
      body: Container(
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
                  widget.exercises!.name!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExerciseForm(
                                    exercises: widget.exercises,
                                  )));
                    },
                    icon: Icon(Icons.edit))
              ],
            ),

            SizedBox(height: 15),

            // Objetivo e Data
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: new Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //'Objetivo'
                  new Text(
                    'Nº Sér/Reps:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.grey.
                        fontSize: 23),
                  ),

                  Padding(padding: EdgeInsets.symmetric(horizontal: 55)),
                  // Objetivo
                  new Text(
                    widget.exercises!.numSeries.toString(),
                    style: TextStyle(
                        // color: Colors.grey.
                        fontSize: 23),
                  ),
                  new Text('X'),
                  new Text(
                    widget.exercises!.numRepeti.toString(),
                    style: TextStyle(fontSize: 23),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            // Observação
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    'Observação:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  new Text(
                    // widget.exercises!.grupoMusc!
                    widget.exercises!.obs!,
                    style: TextStyle(fontSize: 23),
                  )
                ],
              ),
            ),

            SizedBox(height: 15),

            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    'Tipo:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),

                  // GetBuilder<Controller>(builder: (_) {
                  //   return Text(
                  //     // widget.exercises!.tipo!,
                  //     controller.tipoExerc,
                  //     style: TextStyle(fontSize: 23),
                  //   );
                  // })
                  new Text(
                    // widget.exercises!.grupoMusc!
                    widget.exercises!.tipo!,
                    style: TextStyle(fontSize: 23),
                  )
                ],
              ),
            ),

            SizedBox(height: 15),

            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    'Grupo Mus:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  new Text(
                    // widget.exercises!.grupoMusc!
                    widget.exercises!.grupoMusc!,
                    style: TextStyle(fontSize: 23),
                  )
                ],
              ),
            ),

            SizedBox(height: 15),

            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Descanso:',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.only(left: 30)),
                  FaIcon(FontAwesomeIcons.clock),
                  new Text(
                    '${widget.exercises!.restTime!} min',
                    style: TextStyle(fontSize: 23),
                  )
                ],
              ),
            ),

            new Container(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              child: Divider(height: 5),
            ),

            // Ações
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // delete
                IconButton(
                    onPressed: () {
                      removerExercise();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: lightColorScheme.error,
                      size: 50,
                    )),
                // SizedBox(
                //   width: 10,
                //   height: 10,
                // ),

                Container(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    'Deletar Exercício',
                    style: TextStyle(
                        color: lightColorScheme.error,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),

      // Botão flutuante
      // floatingActionButton: FloatingActionButton(
      //     child: FaIcon(FontAwesomeIcons.pen),
      //     onPressed: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => TreinoForm2(
      //                     id: treino.id,
      //                   )));
      //     }),
    );
  }

  void removerExercise() {
    String mensagem = treinoService.removerExercicio(
      widget.id ?? 0, widget.treino,
      // widget.exercises!
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(mensagem),
      ],
    )));

    Future.delayed(Duration(milliseconds: 2500), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => ExercisesList(widget.treino))));
      // Navigator.pop(context);
    });
  }

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
}
