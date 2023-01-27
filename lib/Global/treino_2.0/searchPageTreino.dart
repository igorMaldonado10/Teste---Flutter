import 'package:flutter/material.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';

class SearchPage extends StatefulWidget {
  // const SearchPage({Key? key}) : super(key: key);
  // final List _list;

  // SearchPage(this._list);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TreinoService treinoService = TreinoService();

  //  List treinos = treinoService.display_list;

  // List<Treino_dois> display_list = List.from(treinoService.pegarList());

  void updateList(String value) {
    setState(() {
      treinoService.display_list =
          treinoService.treinos2.where((element) => element.tipoDeTreino!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
       Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Procurar treino",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) =>  updateList(value),
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    hintText: "ex.: Treino A",
                    prefixIcon: Icon(Icons.search)),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                      itemCount: treinoService.display_list.length,
                      itemBuilder: ((context, index) => ListTile(
                            contentPadding: EdgeInsets.all(8.0),
                            title: Text(treinoService.display_list[index].tipoDeTreino!),
                            subtitle:
                                Text("${treinoService.display_list[index].dataDoTreino}"),
                          ))))
            ]),
      ),
    );
  }
}
