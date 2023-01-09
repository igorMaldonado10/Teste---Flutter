import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:teste/Global/exerc%C3%ADcios/exercicios_list.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercicios_service.dart';
import 'package:teste/Global/exerc%C3%ADcios/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';

class CadastroExercicio extends StatefulWidget {
  // const CadastroTreino({Key? key}) : super(key: key);

  //  Guardar o ID do contato selecionado
  // final int id;

  // CadastroExercicio({required this.id});

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
  // final TreinoService treinoService = new TreinoService();

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Treino

    // Exercises exercises = treinoService.listarTreinos().elementAt(widget.id - 1);
    // Exercises exercises = treinoService.listarExercicios().elementAt(widget.id - 1);

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
              color: Colors.grey.shade200),
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
              addTexForm('Nome', name),
              addTexForm('Grupo muscular', grupoMus),
              addTexForm('Tipo', tipo),
              addTexForm('observação', obs),
              addTexForm('Número de séries', numSer),
              addTexForm('Número de repetições', numReps),
              addTexForm('Tempo de descanso', restTime),

              // SizedBox(height: 15),

              // BOTÕES
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão cadastrar
                  new Builder(builder: (BuildContext context) {
                    return ElevatedButton(
                        onPressed: () {
                          cadastrar();

                          Future.delayed(Duration(milliseconds: 2500), () {
                            Navigator.pop(context);
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

  //  Retorna a estrutura do campo input
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
    // TreinoService treinoService = TreinoService();
    ExercicioService exercicioService = ExercicioService();

    // Guardar o último ID cadastrado
    // int ultimoID = treinoService.listarExercicios().length;
    int ultimoID = exercicioService.listarExercicios().length;
    Exercises exercises = Exercises(
        id: ultimoID + 1,
        name: name.text,
        grupoMusc: grupoMus.text,
        tipo: tipo.text,
        obs: obs.text,
        numSeries: numSer.text,
        numRepeti: numReps.text,
        restTime: restTime.text);

// Envia o objeto preenchido para adicionar na lista
    // String mensagem = treinoService.cadastrarExercicio(exercises);
    String mensagem = exercicioService.cadastrarExercicio(exercises);

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

    // Redireciona para a tela de busca
    // Future.delayed(Duration(milliseconds: 2500), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => ExercisesList(id: id)));
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
