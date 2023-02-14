import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';

class TreinoForm2 extends StatefulWidget {
  final int id;
  final Treino_dois treino;

  // Construtor com o atributo obrigatório (id)
  TreinoForm2({required this.id, required this.treino});

  @override
  State<TreinoForm2> createState() => _TreinoForm2State();
}

class _TreinoForm2State extends State<TreinoForm2> {
  // const TreinoForm2({Key? key}) : super(key: key);
  TextEditingController tipoDeTreinoController = TextEditingController();

  TextEditingController dataDoTreinoController = TextEditingController();

  TextEditingController objetivoController = TextEditingController();

  // // Objeto de classe que contém a Busca dos contatos
  final TreinoService treinoService = new TreinoService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tipoDeTreinoController.text = widget.treino.tipoDeTreino!;
    objetivoController.text = widget.treino.objetivo!;
    dataDoTreinoController.text = widget.treino.dataDoTreino!;
  }

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Treino
    Treino_dois treino =
        Provider.of<TreinoService>(context).treinos2.elementAt(widget.id - 1);
    // treinoService.listarTreinos().elementAt(widget.id - 1);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Editar - ${treino.tipoDeTreino}')),
      // appaBarHome(Text('Editar' + ' - ' '${treino.tipoDeTreino}')),
      body: Padding(
        padding: EdgeInsets.all(
          15,
        ),
        child: Column(
          children: [
            Container(
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
                        'Editar treino',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Tipo de treino',
                        hintText: treino.tipoDeTreino),
                    controller: tipoDeTreinoController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Objetivo', hintText: treino.objetivo),
                    controller: objetivoController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Validade do treino',
                        hintText: treino.dataDoTreino),
                    controller: dataDoTreinoController,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        atualizarList();
                        // setState(() {
                        //   treino.tipoDeTreino = tipoDeTreinoController.text;
                        //   treino.objetivo = objetivoController.text;
                        //   treino.dataDoTreino = dataDoTreinoController.text;

                        //   // Navigator.pop(context);
                        //   // Navigator.push(
                        //   //     context,
                        //   //     MaterialPageRoute(
                        //   //         builder: (context) => TreinoList2()));
                        // });
                      },
                      child: new Text('Confirmar')),
                ],
              ),
            )
          ],
        ),
      ),
 
    );
  }

  void atualizarList() {
  
    Treino_dois treino =
        Provider.of<TreinoService>(context, listen: false).treinos2.elementAt(widget.id - 1);

   

    String mensagem = Provider.of<TreinoService>(context, listen: false)
        .atualizarTreino(treino, tipoDeTreinoController.text, objetivoController.text,dataDoTreinoController.text);

    // Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(mensagem),
        ],
      ),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    ));

    // widget.treino.tipoDeTreino = tipoDeTreinoController.text;
    // widget.treino.objetivo = objetivoController.text;
    // widget.treino.dataDoTreino = dataDoTreinoController.text;

    // treinoService.listarTreinos().elementAt(id);
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

  BottomNavigationBar barraInferior() {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
          label: 'Home',
          icon: new IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePage())));
              },
              icon: new FaIcon(FontAwesomeIcons.houseChimney))),
      BottomNavigationBarItem(
          label: 'Perfil',
          icon: new IconButton(
              onPressed: () {}, icon: FaIcon(FontAwesomeIcons.solidCircleUser)))
    ]);
  }
}
