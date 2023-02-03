import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicios_list.dart';
import 'package:teste/Global/treino_2.0/historico_service.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';

class HistoricoTreinos extends StatefulWidget {
  const HistoricoTreinos({Key? key}) : super(key: key);

  @override
  State<HistoricoTreinos> createState() => _HistoricoTreinosState();
}

class _HistoricoTreinosState extends State<HistoricoTreinos> {
  Widget deleteBkgItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).errorColor),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(10),
      child: Icon(Icons.delete),
    );
  }

  HistoricoService historicoService = new HistoricoService();
  showSnackBar(context,index) {
   
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("${historicoService.treinosExecutadosView[index].tipoDeTreino}")));
  }

  Widget showList() {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(4, 8, 4, 75),
        itemCount: historicoService.listarTreinosExecut().length,

        // recebo o índice e o contexto do elemento que vou retornar;
        itemBuilder: (BuildContext context, int index) {
          // Guarda o retorno da lista no objeto da classe
          // Objeto que busca o arquivo treino que retorna a simulação de banco de dados e faz a listagem por id;

          return Dismissible(
              key: ValueKey(historicoService.treinosExecutadosView[index].id),
              // onDismissed: (direction) {
              //   var treinoExec =
              //       historicoService.treinosExecutadosView[index].id;
              //   showSnackBar(context, treinoExec, index);
              // },
              background: deleteBkgItem(),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${historicoService.treinosExecutadosView[index].tipoDeTreino}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          // Text(treino_dois.marcas![index].toString())
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Divider(),
                          height: 5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.timer),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Text('Tempo:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              )),
                          // SizedBox(width: 5),
                          Text(
                              '${historicoService.treinosExecutadosView[index].marca}'
                              // '${treino_dois.marcas!}'
                              // '${historicoService.treinosExecutadosView[index].marcas}'
                              ),

                          Icon(Icons.calendar_month),

                          Text('Data: ' +
                              DateFormat('dd/MM/yyy').format(historicoService
                                      .treinosExecutadosView[index].date ??
                                  DateTime.now()))
                        ],
                      )
                    ],
                  ),
                  // subtitle: Text("${treino_dois.dataDoTreino}"),
                  // trailing:  ,
                ),
              ));
        });
  }

  // ListTile(
  //             contentPadding: EdgeInsets.all(8.0),
  //             title: Row(
  //               children: [
  //                 Text('${historicoService.treinosExecutadosView[index].tipoDeTreino}'),
  //                 SizedBox(
  //                   width: 15,
  //                 ),
  //                 Icon(Icons.timer),
  //                 SizedBox(
  //                   width: 5,
  //                 ),

  //                 // Text(treino_dois.marcas![index].toString())
  //               ],
  //             ),
  //             // subtitle: Text("${treino_dois.dataDoTreino}"),
  //             // trailing:  ,
  //           ),

  // HistoricoService historicoService = new HistoricoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Histórico de treinos'),
      ),

      // drawer: MenuDrawer(),
      body: (historicoService.listarTreinosExecut().length == null ||
              historicoService.listarTreinosExecut().isEmpty)
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.faceDizzy,
                          size: 200,
                          color: Theme.of(context).shadowColor,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            'Nenhum treino executado',
                            style: TextStyle(
                                fontSize: 23,
                                color: Theme.of(context).shadowColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(children: [
              const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       right: 15, left: 15, bottom: 20, top: 5),
              //   child: const TextField(
              //     // onChanged: (value) => _runFilter(value),
              //     decoration: InputDecoration(
              //         labelText: 'Buscar  treino',
              //         suffixIcon: Icon(Icons.search)),
              //   ),
              // ),
              const SizedBox(height: 20),
              Expanded(child: showList()

                  // ListView.builder(
                  //     padding: EdgeInsets.fromLTRB(4, 8, 4, 75),
                  //     itemCount: historicoService.listarTreinosExecut().length,

                  //     // recebo o índice e o contexto do elemento que vou retornar;
                  //     itemBuilder: (BuildContext context, int index) {
                  //       // Guarda o retorno da lista no objeto da classe
                  //       // Objeto que busca o arquivo treino que retorna a simulação de banco de dados e faz a listagem por id;
                  //       Treino_dois treino_dois = historicoService
                  //           .listarTreinosExecut()
                  //           .elementAt(index);

                  //       return ListTile(
                  //         contentPadding: EdgeInsets.all(8.0),
                  //         title: Row(
                  //           children: [
                  //             Text(treino_dois.tipoDeTreino!),
                  //             SizedBox(
                  //               width: 15,
                  //             ),
                  //             Icon(Icons.timer),
                  //             SizedBox(
                  //               width: 5,
                  //             ),

                  //             // Text(treino_dois.marcas![index].toString())
                  //           ],
                  //         ),
                  //         subtitle: Text("${treino_dois.dataDoTreino}"),
                  //         // trailing:  ,
                  //       );
                  //     })
                  ),
            ]),
    );
  }
}
