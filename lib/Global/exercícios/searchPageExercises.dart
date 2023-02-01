import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/exerc%C3%ADcios/Filter%20Chip/filterChipMusc.dart';
import 'package:teste/Global/exerc%C3%ADcios/Filter%20Chip/filterChipTipo.dart';
import 'package:teste/Global/exerc%C3%ADcios/informa%C3%A7%C3%B5es_exer.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';

class SearchPageExerc extends StatefulWidget {
  // const SearchPage({Key? key}) : super(key: key);
  // final List _list;
  final Treino_dois? treino;
  final Exercises? exercises;

  SearchPageExerc({this.treino, this.exercises});

  @override
  State<SearchPageExerc> createState() => _SearchPageExercState();
}

class _SearchPageExercState extends State<SearchPageExerc> {
  // TreinoService treinoService = TreinoService();
  bool? filter = false;
  //  List treinos = treinoService.display_list;
  late List<Exercises> display_list_exerc =
      List.from(widget.treino!.listExercises!);

  // List<Treino_dois> display_list = List.from(treinoService.pegarList());

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
              Text(
                "Procurar exercício",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
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
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
              (this.filter == true)?
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
                          Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                        Text('Tipo de exercício',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),)
                       ],   
                      ),
                      // SizedBox(height: 5),
                      FilterChipExercTipo(
                        onSelectedChange: (value) => updateListTipo(value),
                        items_filters: [
                          'Máquina',
                          'Hálteres',
                          'Peso do corpo',
                        ],
                      ),
                    ],
                  )): Container(),
              SizedBox(height: 20),
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
                              // icon: Icon(Icons.more_vert_rounded)
                            ),
                          ))))
            ]),
      ),
    );
  }
}
