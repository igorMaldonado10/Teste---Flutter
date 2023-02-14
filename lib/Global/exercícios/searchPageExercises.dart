import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/exerc%C3%ADcios/Filter%20Chip/filterChipMusc.dart';
import 'package:teste/Global/exerc%C3%ADcios/Filter%20Chip/filterChipTipo.dart';
import 'package:teste/Global/exerc%C3%ADcios/informa%C3%A7%C3%B5es_exer.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';


class SearchPageExerc extends StatefulWidget {
 
  final Treino_dois? treino;
  final Exercises? exercises;

  SearchPageExerc({this.treino, this.exercises});

  @override
  State<SearchPageExerc> createState() => _SearchPageExercState();
}

class _SearchPageExercState extends State<SearchPageExerc> {
  
  bool? filter = false;
 
  late List<Exercises> display_list_exerc =
      List.from(widget.treino!.listExercises!);

  

  void updateList(String value) {
    setState(() {
      display_list_exerc = widget.treino!.listExercises!
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void updateListMusc(String value) {
    setState(() {
      display_list_exerc = widget.treino!.listExercises!
          .where((element) =>
              element.grupoMusc!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void updateListTipo(String value) {
    setState(() {
      display_list_exerc = widget.treino!.listExercises!
          .where((element) =>
              element.tipo!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Título da página 
              Text(
                "Procurar exercício",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              // Campo de busca de exercícios
              TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    hintText: "ex.: Treino A",
                    prefixIcon: Icon(Icons.search)),
              ),

              SizedBox(
                height: 5,
              ),
 
              // CheckBox para abrir o filtro de chips
                Row(
                          children: [
                            Checkbox(
                                activeColor: Color.fromRGBO(211, 111, 47, 100),
                                value: this.filter,
                                onChanged: (Value) {
                                  setState(() {
                                    this.filter = Value;
                                  });
                                }),
                            new Text(
                              'Filtro Selecionável',
                              style: TextStyle(
                                color: Theme.of(context).hintColor
                              ),
                            )
                          ],
                        ),

              // If ternário para mostrar ou não o filtro quando o checkBox estiver selecionado
              (this.filter == true)?

              // Título do filtro
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                        Text('Músculo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),)
                       ],   
                      ),

                      // Filtro de chips por grupo muscular
                      FilterChipExercMusc(
                        onSelectedChange: (value) => updateListMusc(value),
                        items_filters: [
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

                       // Título do filtro
                       Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                        Text('Tipo de exercício',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),)
                       ],   
                      ),
                     
                     // Filtro de chips por tipo de exercício
                      FilterChipExercTipo(
                        onSelectedChange: (value) => updateListTipo(value),
                        items_filters: [
                          'Máquina',
                          'Hálteres',
                          'Peso do corpo',
                        ],
                      ),

                    ],
                  ))
                  : Container(),

              SizedBox(height: 20),

              // Lista de visualização do filtro
              Expanded(
                  child: ListView.builder(
                      itemCount: display_list_exerc.length,
                      itemBuilder: ((context, index) => ListTile(
                            contentPadding: EdgeInsets.all(8.0),
                            title: Text(display_list_exerc[index].name!),
                            subtitle: Text(
                                "${display_list_exerc[index].numSeries}" +
                                    '/' +
                                    '${display_list_exerc[index].numRepeti}'),
                            trailing: IconButton(
                              iconSize: 30,
                              onPressed: () {

                                // Cada treino tem o seu próprio ID, então, lógicamente cada ID tem a sua página de treino
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InfoExercises(
                                              treino: widget.treino!,
                                              exercises:
                                                  display_list_exerc[index],
                                            )));
                              },
                              icon: FaIcon(FontAwesomeIcons.chevronRight),
                           
                            ),
                          )
                        )
                      )
                    )
            ]
          ),
      ),
    );
  }
}
