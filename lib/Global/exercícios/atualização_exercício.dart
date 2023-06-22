import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:teste/Global/exerc%C3%ADcios/Toggle%20Buttons/class_GetX_bool_for_string.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'Chips/list_of_chips.dart';
import 'Toggle Buttons/toggleButtons1.dart';


class ExerciseForm extends StatefulWidget {
  final int? id;
 
  final Exercises? exercises;

  // Construtor com o atributo obrigatório (id)
  ExerciseForm({this.id, this.exercises});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  // const TreinoForm2({Key? key}) : super(key: key);
  final nameExercisesController = TextEditingController();
  final obsController = TextEditingController();
  final numSer = TextEditingController();
  final numReps = TextEditingController();
  final restTime = TextEditingController();
  final tipo = TextEditingController();
  final grupoMuscController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameExercisesController.text = widget.exercises!.name!;
    obsController.text = widget.exercises!.obs!;
    numSer.text = widget.exercises!.numSeries!.toString();
    numReps.text = widget.exercises!.numRepeti!.toString();
    restTime.text = widget.exercises!.restTime!;
    grupoMuscController.text = widget.exercises!.grupoMusc!;
    // tipo.text = widget.exercises!.tipo!;
  }

  @override
  Widget build(BuildContext context) {
   

    // final controller = Get.find<Controller>();

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Editar' + ' - ' '${widget.exercises!.name!}'),
      ),
      
      body: SingleChildScrollView(
        child: Padding(
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
                    
                    // Título da página
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Editar Exercício',
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

                    // Nome do exercício
                    TextFormField(
                      inputFormatters: [LengthLimitingTextInputFormatter(16)],
                      decoration: InputDecoration(
                          labelText: 'Nome do exercício',
                          hintText: widget.exercises?.name!),
                      controller: nameExercisesController,
                    ),
                   
                    SizedBox(height: 30),


                  //  Lista de chips para o grupo muscular
                    Container(
                      padding: EdgeInsets.only(right: 230),
                      child: Text('Grupo muscular'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListOfChips(
                        onSelectedChange: (String value) {
                          grupoMuscController.text = value;
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
                      padding: EdgeInsets.only(right: 230),
                      child: Text('Tipo de exercício'),
                    ),

                    SizedBox(height: 30),

                    ToggleButtons1(exercises: widget.exercises),

                    Padding(padding: EdgeInsets.all(10)),

                     // Número de séries
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Número de séries',
                          hintText: widget.exercises?.numSeries!.toString()),
                      controller: numSer,
                    ),

                    Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                    
                     // Número de repetições
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Número de repetições',
                          hintText: widget.exercises?.numRepeti!.toString()),
                      controller: numReps,
                    ),

                    Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),

                    // Tempo de descanso
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Tempo de descanso',
                          hintText: widget.exercises?.restTime),
                      controller: restTime,
                    ),

                    Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),

                    // Observação
                    TextFormField(
                      inputFormatters: [LengthLimitingTextInputFormatter(15)],
                      decoration: InputDecoration(
                          labelText: 'Observação',
                          hintText: widget.exercises!.obs!),
                      controller: obsController,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // Botão de atualizar exercício
              Container(
                width: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          atualizarExercicio();
                       
                        },
                        child: new Text('Confirmar')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: barraInferior(),
    );
  }

  void atualizarExercicio() {
    final controller = Get.find<Controller>();
 
    String mensagem = Provider.of<TreinoService>(context, listen: false)
        .atualizarExercicio(
           exercises: widget.exercises!,
           name: nameExercisesController.text,
           numSeries: numSer.text,
           numReps: numReps.text,
           grupoMusc: grupoMuscController.text,
           tipo: controller.tipoExerc,
           obs:  obsController.text,
           restTime: restTime.text);

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


  
}
