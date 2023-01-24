import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/exerc%C3%ADcios/Toggle%20Buttons/toggleButtons1.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicios_list.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercises.dart';
import 'package:teste/Global/exerc%C3%ADcios/Chips/list_of_chips.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';

class CadastroExercicio extends StatefulWidget {
  // final List<String> items;
  // const CadastroTreino({Key? key}) : super(key: key);
  // final List list;
  //  Guardar o ID do contato selecionado

  // final int? id;
  final Treino_dois? treino;

  CadastroExercicio({ this.treino});

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

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Treino

    // Exercises exercises = treinoService.listarTreinos().elementAt(widget.id - 1);
    // Exercises exercises = treinoService.listarExercicios().elementAt(widget.id - 1);
    // Treino_dois treino = treinoService.listarTreinos().elementAt(widget.id - 1);

    return Scaffold(
      appBar: appaBarHome(Text('Cadastro Exercício')),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        // CONTAINER DO FORM
        child: Container(
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
                  'Cadastro de Exercício',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // Campos do formulários
              addTexForm('Nome do exercício', name),
              // addTexForm('Grupo muscular', grupoMus),
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
                  items: ['Toráx', 'Abdômen', 'Costas', 'Ombros', 'Peito', 'Bíceps', 'Tríceps', 'Lombar', 'Quadríceps', 'Posterior coxa', 'Gêmeos' ],
                ),
              ),
             
              Container(
                padding: EdgeInsets.only(right: 165),
                child: Text('Tipo de exercício'),
              ),

              SizedBox(height: 30),

             ToggleButtons1(),

             Padding(padding: EdgeInsets.all(10)),

              
              addTexForm('observação', obs),
              

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

              new Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                keyboardType: TextInputType.number,
             // recebe o valor dos campos
             controller: restTime,

            decoration: InputDecoration(
            labelText: 'Tempo de descanso(minutos)',
          // hintText: '',
          // Borda do Input
            border: OutlineInputBorder(borderSide: BorderSide()),
        ),
      ),
    ),
              // addTexForm('Tempo de descanso', restTime),
 
              // SizedBox(height: 15),

              // BOTÕES
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão cadastrar
                  new Builder(builder: (BuildContext context) {
                    return ElevatedButton(
                        onPressed: () {
                         setState(() {
                              cadastrar();
                          
                          Future.delayed(Duration(milliseconds: 2500), () {
                            Navigator.pop(context);
                          });
                         });
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
    // ExercicioService exercicioService = ExercicioService();

    // Treino_dois treino = treinoService.listarTreinos().elementAt(widget.id!);

    // Guardar o último ID cadastrado
    // int ultimoID = treinoService.listarExercicios().length;
    int ultimoID = widget.treino!.listExercises!.length;
    // int ultimoID = treino.listExercises!.length;
    

    Exercises exercises = Exercises(
        id: ultimoID + 1,
        name: name.text,
        grupoMusc: grupoMus.text,
        tipo: tipo.text,
        obs: obs.text,
        numSeries: int.parse(numSer.text),
        numRepeti: int.parse(numReps.text),
        restTime: restTime.text);

// Envia o objeto preenchido para adicionar na lista
    String mensagem = treinoService.cadastrarExercicio(exercises, widget.treino!);
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
    tipo.text = '';
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
