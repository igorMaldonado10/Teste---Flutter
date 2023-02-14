
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/Global/treino_2.0/editarTreino/atualiza%C3%A7ao_treino.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';

class EditTreino extends StatefulWidget {
  // const EditTreino({Key? key}) : super(key: key);

  // Guardar o ID do contato selecionado
  final int id;

  // Construtor com o atributo obrigatório (id)
  EditTreino({required this.id});

  @override
  State<EditTreino> createState() => _EditTreinoState();
}

class _EditTreinoState extends State<EditTreino> {
  // Objeto de classe que contém a Busca dos contatos
  final TreinoService treinoService = new TreinoService();

  bool? exerCheck = false;

  @override
  Widget build(BuildContext context) {
    // Objeto que busca o arquivo treino que retorna a simulação de banco de dados e faz a listagem por id;

    // Objeto da classe Treino

    Treino_dois treino =
        Provider.of<TreinoService>(context).treinos2.elementAt(widget.id - 1);
    //  treinoService.listarTreinos().elementAt(widget.id - 1);

    return Scaffold(
      // Barra de título
      appBar: AppBar(
          centerTitle: true,
          title: Text('Informações - ${treino.tipoDeTreino}')),
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
                  treino.tipoDeTreino!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TreinoForm2(
                                    id: treino.id!,
                                    treino: treino,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //'Objetivo'
                  new Text(
                    'Objetivo:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.grey.
                        fontSize: 23),
                  ),

                  // Objetivo
                  new Text(
                    treino.objetivo!,
                    style: TextStyle(
                        // color: Colors.grey.
                        fontSize: 23),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            // Data do treino
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    'Validade do treino:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  new Text(
                    treino.dataDoTreino!,
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
                Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).errorColor)),
                        onPressed: () {
                          removerTreino();
                        },
                        child: Text(
                          'Deletar Treino',
                          style:
                              TextStyle(color: Theme.of(context).canvasColor),
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void removerTreino() {
   
    String mensagem = Provider.of<TreinoService>(context, listen: false)
        .removerTreino(widget.id);
    // String mensagem = treinoService.removerTreino(widget.id);

    
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(mensagem),
      ],
    )));

    // Future.delayed(Duration(milliseconds: 2500), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: ((context) => TreinoList2())));
    // });
  }

}
