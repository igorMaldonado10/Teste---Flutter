import 'package:flutter/material.dart';
import 'package:teste/Global/exerc%C3%ADcios/Timer/timer.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/exerc%C3%ADcios/informa%C3%A7%C3%B5es_exer.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';

class ListExerciseItem extends StatefulWidget {

  final Exercises exercises;
  final Treino_dois? treino;
 

  ListExerciseItem({required this.exercises, this.treino});

  @override
  State<ListExerciseItem> createState() => _ListExerciseItemState();
}

class _ListExerciseItemState extends State<ListExerciseItem> {
  bool? exerCheck = false;

  int numInicial = 0;
  // int execucoes = 0;


//   void numExecucoes(){
//   while(execucoes  < 1000){
//    setState(() {
//       widget.treino?.listNumExecuc?.add(execucoes);
//     execucoes++;
//    });
//   }
// }

// Método para incrementar as série no decorrer na execução do exercício
  void increment() {
    if (numInicial < widget.exercises.numSeries!) {
      setState(() {
        numInicial++;
      });
    } else {
      exerCheck = true;
    }
  }

// Método para decrementar as série no decorrer na execução do exercício
  void decrement() {
    if (numInicial >= 1) {
      setState(() {
        numInicial--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), topRight: Radius.circular(20)),
        color: Theme.of(context).highlightColor,
      ),
      height: 150,
      // width: 500,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
     
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.exercises.name!,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    // Checkbox(
                    //     activeColor: Color.fromRGBO(211, 111, 47, 100),
                    //     value: this.exerCheck,
                    //     onChanged: (newValue) {
                    //       setState(() {
                    //         this.exerCheck = newValue;
                    //       });
                    //     }),

                    // IconButton(
                    //     // iconSize: ,
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) =>
                    //                   new EditExercises(
                    //                     id: exercises.id,
                    //                   )));
                    //     },
                    //     icon: Icon(
                    //       Icons.more_vert_rounded,
                    //       // color: darkColorScheme.secondary,
                    //     )),
                  ],
                ),


                SizedBox(
                  height: 10,
                ),


                new Text(
                    'nº repetições:' + ' ' + '${widget.exercises.numRepeti}'),
                SizedBox(height: 5),

                // If ternário para comparar o quantidade da variável com o número de séries
                (numInicial < widget.exercises.numSeries!)
                    ? Row(
                        children: [
                          new Text('Séries:' + ' '),
                          IconButton(
                              focusColor: Theme.of(context).backgroundColor,
                              onPressed: () {
                                decrement();
                              },
                              icon: FaIcon(FontAwesomeIcons.minus)),

                          new Text('$numInicial'),
                          new Text('/'),
                          new Text('${widget.exercises.numSeries}'),

                          IconButton(
                              focusColor: Theme.of(context).backgroundColor,
                              highlightColor: Theme.of(context).backgroundColor,
                              onPressed: () {
                                increment();
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.plus,
                              )),

                          Padding(padding: EdgeInsets.only(right: 10)),

                          // Botão para acessar o cronônometro do app
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TimerClock()));
                              },
                              icon: FaIcon(FontAwesomeIcons.solidClock))
                        ],
                      )
                    : Icon(
                        Icons.check_circle,
                        color: Theme.of(context).backgroundColor,
                      ),
              ],
            ),
          ],
        ),
        
        // Botão para acessar as informações cadastradas do aexercício
        trailing: Container(
          alignment: Alignment.center,
          height: 100,
          width: 70,
          child: Row(
            children: [
             
              Padding(padding: EdgeInsets.only(bottom: 20)),

            
              IconButton(
                iconSize: 50,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => InfoExercises(
                                exercises: widget.exercises,
                                treino: widget.treino!,
                              ))));
                },
                icon: FaIcon(FontAwesomeIcons.chevronRight),
                // icon: Icon(Icons.more_vert_rounded)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
