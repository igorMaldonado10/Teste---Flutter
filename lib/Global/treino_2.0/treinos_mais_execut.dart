import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/treino_2.0/historico_pages/historico_service.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';

class TreinosMaisExecut extends StatefulWidget {
  const TreinosMaisExecut({Key? key}) : super(key: key);

  @override
  State<TreinosMaisExecut> createState() => _TreinosMaisExecutState();
}

class _TreinosMaisExecutState extends State<TreinosMaisExecut> {
  HistoricoService historicoService = new HistoricoService();
  TreinoService treinoService = TreinoService();
  bool isSorted = false;

    sort() {
    if (!isSorted) {
      setState(() {
        treinoService.display_list.sort(((Treino_dois a, Treino_dois b) =>
            a.listExecucoes?.last ?? 0.compareTo(b.listExecucoes?.last ?? 0)));
        isSorted = true;
      });
    } else {
      setState(() {
        treinoService.display_list =
            treinoService.display_list.reversed.toList();
      });
    }

    // setState(() {
    //   treinoService.display_list.length;
    // });
  }

  // sort() {
  //   if (!isSorted) {
  //     setState(() {
  //       treinoService.display_list.sort(((Treino_dois a, Treino_dois b) =>
  //           a.execucoesDeTreino!.compareTo(b.execucoesDeTreino!)));
  //       isSorted = true;
  //     });
  //   } else {
  //     setState(() {
  //       treinoService.display_list =
  //           treinoService.display_list.reversed.toList();
  //     });
  //   }

  //   setState(() {
  //     treinoService.display_list.length;
  //   });
  // }

  Widget showList() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/imgs/podium-41242.png',
                  width: 390,
                ),
              )
            ],
          ),
        ),
        ListView.builder(
            padding: EdgeInsets.fromLTRB(4, 8, 4, 75),
            itemCount: treinoService.display_list.length,
            // historicoService.listarTreinosExecut().length,

            // recebo o índice e o contexto do elemento que vou retornar;
            itemBuilder: (BuildContext context, int index) {
              // Guarda o retorno da lista no objeto da classe
              // Objeto que busca o arquivo treino que retorna a simulação de banco de dados e faz a listagem por id;
              Treino_dois treino_dois =
                  treinoService.display_list.elementAt(index);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 8.0, left: 8.0, bottom: 16, top: 16),
                    child: ListTile(
                      // contentPadding: EdgeInsets.all(8.0),
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${index + 1} º',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                              SizedBox(
                                width: 85,
                              ),
                              Column(
                                children: [
                                  Text(
                                    treino_dois.tipoDeTreino!,
                                    // '${historicoService.treinosExecutadosView[index].tipoDeTreino}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ),
                                ],
                              ),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              

                              (treino_dois.execucoesDeTreino == null)
                                  ? Text(
                                      '0x',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .backgroundColor),
                                    )
                                  :
                                    Text(
                                      '${treino_dois.execucoesDeTreino}x',//Em caso de erro desmarque esse comentário///////
                                     
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .backgroundColor),
                                    ),
                            ],
                          )
                        ],
                      ),
                      // subtitle: Text("${treino_dois.dataDoTreino}"),
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Treinos mais executados'),
        actions: [
          (treinoService.listarTreinos().length == null ||
                  treinoService.listarTreinos().isEmpty)
              ? Container()
              : IconButton(
                  onPressed: () => sort(), icon: Icon(Icons.swap_vert_circle))
        ],
      ),

      // drawer: MenuDrawer(),
      body: (treinoService.listarTreinos().length == null ||
              treinoService.listarTreinos().isEmpty)
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
                            'Nenhum treino criado',
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
              const SizedBox(height: 20),
              Expanded(child: showList()),
            ]),
    );
  }
}
