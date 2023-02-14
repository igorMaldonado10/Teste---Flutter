import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';

class CadastroTreino extends StatefulWidget {
  // const CadastroTreino({Key? key}) : super(key: key);

  @override
  State<CadastroTreino> createState() => _CadastroTreinoState();
}

class _CadastroTreinoState extends State<CadastroTreino> {
  final tipoDeTreino = TextEditingController();
  final objetivo = TextEditingController();
  final data = TextEditingController();

  save() {
    // Guardar o último ID cadastrado
    // TreinoService treinoService = TreinoService();

    int ultimoID = Provider.of<TreinoService>(context, listen: false).treinos2.length;
    // treinoService.listarTreinos().length;

    Treino_dois treino_dois = Treino_dois(
        id: ultimoID + 1,
        tipoDeTreino: tipoDeTreino.text,
        dataDoTreino: data.text,
        objetivo: objetivo.text,
        date: DateTime.now(),
        listExercises: []);

    String mensagem = Provider.of<TreinoService>(context, listen: false)
        .cadastrarTreino(treino_dois);

    Navigator.pop(context);

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastro de Treino'),
      ),
      // drawer: MenuDrawer(),
      body: SingleChildScrollView(
        // Container do Form
        child: Column(
          children: [
           
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Título
                  new Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 45),
                    child: Text(
                      'Cadastro de Treino',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Campos do formulários
                  addTexForm('Tipo de treino', tipoDeTreino),
                  addTexForm('Objetivo', objetivo),
                  addTexForm('Validade', data),

                  // SizedBox(height: 15),

                  // Botões
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Botão cadastrar
                      new Builder(builder: (BuildContext context) {
                        return ElevatedButton(
                            onPressed: () {
                              save();
                              // cadastrar();

                              // Future.delayed(Duration(milliseconds: 2500), () {
                              //   Navigator.pop(context);
                              //   // Navigator.push(
                              //   //     context,
                              //   //     MaterialPageRoute(
                              //   //         builder: (context) => TreinoList2()));
                              // });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: new Text('Cadastrar'),
                            ));
                      }),

                      // Botão limpar
                      new Builder(builder: (BuildContext context) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: lightColorScheme.error),
                            onPressed: () {
                              limpar();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: new Text(
                                'Limpar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ));
                      })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  Retorna a estrutura do campo input
  Container addTexForm(String nomoDoCampo, TextEditingController controller) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        // recebe o valor dos campos
        controller: controller,

        decoration: InputDecoration(
          labelText: nomoDoCampo,

          // Borda do Input
          border: OutlineInputBorder(borderSide: BorderSide()),
        ),
      ),
    );
  }

  // método de Cadastrar
//   void cadastrar() {
//     TreinoService treinoService = new TreinoService();

//     // Guardar o último ID cadastrado
//     int ultimoID = treinoService.listarTreinos().length;
//     // final dataInic = treinoService.treinos2;

//     Treino_dois treino_dois = Treino_dois(
//         id: ultimoID + 1,
//         tipoDeTreino: tipoDeTreino.text,
//         dataDoTreino: data.text,
//         objetivo: objetivo.text,
//         date: DateTime.now(),
//         listExercises: []);

// // Envia o objeto preenchido para adicionar na lista
//     String mensagem = treinoService.cadastrarTreino(treino_dois);

//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(mensagem),
//         ],
//       ),
//       duration: Duration(seconds: 3),
//       behavior: SnackBarBehavior.floating,
//     ));

//     // Redireciona para a tela de busca
//     // Future.delayed(Duration(milliseconds: 2500), () {
//     //   Navigator.pop(context);
//     //   // Navigator.push(
//     //   //     context, MaterialPageRoute(builder: (context) => TreinoList2()));
//     // });
//   }

  // Limpar campos
  void limpar() {
    tipoDeTreino.text = '';
    objetivo.text = '';
    data.text = '';
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
      // leading: Builder(builder: (BuildContext context) {
      //   return IconButton(
      //       icon: FaIcon(FontAwesomeIcons.bars),
      //       onPressed: () => Scaffold.of(context).openDrawer());
      // })
    );
  }
}
