// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/treino_2.0/treino_form2.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';
import 'package:teste/Global/treino_2.0/treino_service.dart';
import 'package:teste/models/treino_model.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';

class EditTreino extends StatelessWidget {
  // const EditTreino({Key? key}) : super(key: key);

  // Guardar o ID do contaro selecionado
  final int id;

  // Construtor com o atributo obrigatório (id)
  EditTreino({required this.id});

  // Objeto de classe que contém a Busca dos contatos
  final TreinoService treinoService = new TreinoService();

  @override
  Widget build(BuildContext context) {
     
     

     // Objeto que busca o arquivo treino que retorna a simulação de banco de dados e faz a listagem por id;

    // Objeto da classe Treino
    Treino_dois treino = treinoService.listarTreinos().elementAt(id - 1);

    return Scaffold(
        // Barra de título
        appBar: appaBarHome(Text('Informações')),
        // Menu (Hambúrguer)
        drawer: MenuDrawer(),

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
                    treino.tipoDeTreino,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ],
              ),

              SizedBox(height: 15),

              // Objetivo e Data
              Container(
                color: Colors.grey.shade200,
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
                      treino.objetivo,
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
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text(
                      'Validade do treino:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                    new Text(
                      treino.dataDoTreino,
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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: lightColorScheme.error,
                        size: 50,
                      )),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),

                  Text(
                    'Deletar treino',
                    style: TextStyle(
                        color: lightColorScheme.error,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),

        // Botão flutuante
        floatingActionButton: FloatingActionButton(
            child: FaIcon(FontAwesomeIcons.pen),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => TreinoForm2(id: treino.id,))
              );
            }));
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