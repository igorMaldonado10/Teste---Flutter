import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercises.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListExerciseItem extends StatelessWidget {
  // const ListExerciseItem({Key? key}) : super(key: key);
  final Exercises exercises;
  ListExerciseItem(this.exercises);

  bool? exerCheck = false;
 
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
        topRight: Radius.circular(20)
        ),
        color: Theme.of(context).cardColor,),
        height: 150,
        // width: 200,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ListTile(
          // leading:

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        exercises.name!,
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
                  new Text('nº repetições:' + ' ' + '${exercises.numRepeti}'),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      new Text('Séries:' + ' '),
                      IconButton(
                          onPressed: () {
                            // decrement();
                          },
                          icon: FaIcon(FontAwesomeIcons.minus)),
                      // new Text('$_numInicial'),
                      // new Text('/'),
                      new Text('${exercises.numSeries}'),
                      IconButton(
                          onPressed: () {
                            // increment();
                          },
                          icon: FaIcon(FontAwesomeIcons.plus))
                    ],
                  ),
                ],
              ),
            ],
          ),

          trailing: Container(
            alignment: Alignment.center,
            height: 100,
            width: 70,
            child: Row(
              children: [
                // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined)),
                // IconButton(
                //     iconSize: 25,
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.delete,
                //       color: lightColorScheme.error,
                //     )),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 40,
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.chevronRight),
                      // icon: Icon(Icons.more_vert_rounded)
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        );
  }
  
}
