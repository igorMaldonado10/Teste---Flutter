import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:teste/Global/exerc%C3%ADcios/Toggle%20Buttons/class_GetX_bool_for_string.dart';
import 'package:teste/Global/exerc%C3%ADcios/Toggle%20Buttons/toggleButtons1.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/exerc%C3%ADcios/Chips/list_of_chips.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';

class CadastroExercicio extends StatefulWidget {
  // const CadastroTreino({Key? key}) : super(key: key);

  //  Guardar o ID do contato selecionado
  // final controller = Get.find<Controller>();
  // final int? id;
  final Exercises? exercises;
  final Treino_dois? treino;

  CadastroExercicio({this.treino, this.exercises});

  @override
  State<CadastroExercicio> createState() => _CadastroExercicioState();
}

class _CadastroExercicioState extends State<CadastroExercicio> {
  final name = TextEditingController();
  final grupoMus = TextEditingController();
  final tipo = TextEditingController();
  final obs = TextEditingController();
  final numSer = TextEditingController();
  final numReps = TextEditingController();
  final restTime = TextEditingController();

  // // Objeto de classe que contém a Busca dos contatos
  final TreinoService treinoService = new TreinoService();

  saveExercise() {
    final controller = Get.put(Controller());


    int ultimoID = widget.treino!.listExercises!.length;

    Exercises exercises = Exercises(
        id: ultimoID + 1,
        name: name.text,
        grupoMusc: grupoMus.text,
        tipo: controller.tipoExerc,
        obs: obs.text,
        numSeries: int.parse(numSer.text),
        numRepeti: int.parse(numReps.text),
        restTime: restTime.text);

// Envia o objeto preenchido para adicionar na lista
    String mensagem = Provider.of<TreinoService>(context, listen: false)
        .cadastrarExercicio(exercises, widget.treino!);

   
    Navigator.pop(context);


    Get.rawSnackbar(
      title: 'Sucesso!',
      message: mensagem,
      duration: Duration(milliseconds: 2000),
      snackPosition: SnackPosition.TOP,
      showProgressIndicator: true
    );

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text(mensagem),
    //     ],
    //   ),
    //   duration: Duration(seconds: 3),
    //   behavior: SnackBarBehavior.floating,
    // ));
  }

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Treino

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastro de Exercício'),
      ),
      // drawer: MenuDrawer(),
      body: SingleChildScrollView(
      
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

                  // Título da página
                  new Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 45),
                    child: Text(
                      'Cadastro de Exercício',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Campos do formulários
                  new Container(
                 margin: EdgeInsets.only(bottom: 10),
                 child: TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16)
                  ],
                 // recebe o valor dos campos
                 controller: name,

                 decoration: InputDecoration(
                 labelText: 'Nome do exercício',

                 // Borda do Input
                 border: OutlineInputBorder(borderSide: BorderSide()),
        ),
      ),
    ),
                 
                 //  Lista de chips para o grupo muscular
                  Container(
                    padding: EdgeInsets.only(right: 175),
                    child: Text('Grupo muscular'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListOfChips(
                      onSelectedChange: (String value) {
                        grupoMus.text = value;
                      },
                      items: [
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
                  ),


                  // Toggle buttons para a escolha do tipo  de exercício
                  Container(
                    padding: EdgeInsets.only(right: 165),
                    child: Text('Tipo de exercício'),
                  ),

                  SizedBox(height: 30),

                  ToggleButtons1(exercises: widget.exercises),

                  Padding(padding: EdgeInsets.all(10)),

                  // Número de séries
                  new Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,

                      // recebe o valor dos campos
                      controller: numSer,

                      decoration: InputDecoration(
                        labelText: 'Número de séries',

                        // Borda do Input
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                    ),
                  ),
                  
                  // Número de repetições
                  new Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      // recebe o valor dos campos
                      controller: numReps,

                      decoration: InputDecoration(
                        labelText: 'Número de repetições',

                        // Borda do Input
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                    ),
                  ),

                  // Tempo de descanso
                  new Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      // recebe o valor dos campos
                      controller: restTime,

                      decoration: InputDecoration(
                        labelText: 'Tempo de descanso',

                        // Borda do Input
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                    ),
                  ),


                  // Observação
                  new Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15)
                    ],
                  // recebe o valor dos campos
                  controller: obs,

                  decoration: InputDecoration(
                  labelText: 'Observação',

                   // Borda do Input
                   border: OutlineInputBorder(borderSide: BorderSide()),
        ),
      ),
    ),
                

                  // BOTÕES
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // Botão cadastrar exercício
                      new Builder(builder: (BuildContext context) {
                        return ElevatedButton(
                            onPressed: () {
                              saveExercise();
                           
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: new Text('Cadastrar'),
                            ));
                      }),

                      // Botão limpar campos 
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

  //  Retorna a estrutura do campos de texto
  Container addTexForm(String nomoDoCampo, TextEditingController controller) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
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
  void cadastrar() {
    final controller = Get.put(Controller());

    // GetBuilder<Controller>(builder: (_) {
    //                 return Text(
    //                   // widget.exercises!.tipo!,
    //                   controller.tipoExerc,
    //                   style: TextStyle(fontSize: 23),
    //                 );
    //               });

    // Treino_dois treino = treinoService.listarTreinos().elementAt(widget.id!);

    // Guardar o último ID cadastrado
    // int ultimoID = treinoService.listarExercicios().length;
    int ultimoID = widget.treino!.listExercises!.length;

    Exercises exercises = Exercises(
        id: ultimoID + 1,
        name: name.text,
        grupoMusc: grupoMus.text,
        tipo: controller.tipoExerc,
        obs: obs.text,
        numSeries: int.parse(numSer.text),
        numRepeti: int.parse(numReps.text),
        restTime: restTime.text);

// Envia o objeto preenchido para adicionar na lista
    String mensagem =
        treinoService.cadastrarExercicio(exercises, widget.treino!);
    // String mensagem = exercicioService.cadastrarExercicio(exercises, widget.id);

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

    // Redireciona para a tela de busca de exercícios
    // Future.delayed(Duration(milliseconds: 2500), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => ExercisesList(widget.treino)));
    // });
  }

  // Limpar campos
  void limpar() {
    name.text = '';
    grupoMus.text = '';
    // tipo.text = '';
    obs.text = '';
    numSer.text = '';
    numReps.text = '';
    restTime.text = '';
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
}

/// PROBLEMA: não conseguir sincronizar cada treino ao seu respectivo treino;
