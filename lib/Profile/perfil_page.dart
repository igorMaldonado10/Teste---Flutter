
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teste/Profile/atualiza%C3%A7%C3%A3o_perfil.dart';
import 'package:teste/Profile/cadastro_perfil.dart';
import 'package:teste/Profile/editar_perfil.dart';
import 'package:teste/Profile/perfil_model.dart';
import 'package:teste/Profile/perfil_service.dart';
import 'package:teste/view/recursos/barraSuperior.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';
import 'package:image_picker/image_picker.dart';

// final tema = ValueNotifier(ThemeMode.light)

class PerfilPage extends StatefulWidget {
  // const EditTreino({Key? key}) : super(key: key);

  // Guardar o ID do contato selecionado
  // int? id = 1;
  // XFile? foto;
  // PerfilPage({this.foto});
  // // // // Construtor com o atributo obrigatório (id)
  // PerfilPage({required this.id});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  // Objeto de classe que contém a Busca dos contatos
  final PerfilService perfilService = new PerfilService();

  @override
  Widget build(BuildContext context) {
    // Objeto que busca o arquivo treino que retorna a simulação de banco de dados e faz a listagem por id;

    // Objeto da classe Treino
    // User user = perfilService.listaUser().elementAt();
    PerfilService perfilService = PerfilService();
    //  PerfilService perfil = perfilService.listaUser().elementAt(widget.id - 1);

    return Scaffold(
      // Barra de título
      appBar: appaBarHome(Text('Perfil')),
      // Menu (Hambúrguer)
      drawer: MenuDrawer(),

      // Corpo
      body: (perfilService.listaUser().length == null ||
              perfilService.listaUser().isEmpty)
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
                          FontAwesomeIcons.faceSadTear,
                          size: 200,
                          color: Theme.of(context).shadowColor,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CadastroPerfil()));
                            },
                            child: Text(
                              'Cadastrar Perfil',
                              style: TextStyle(
                                  color: Theme.of(context).shadowColor),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          : 
          Container(
              child: ListView.builder(
                itemCount: perfilService.listaUser().length,
                itemBuilder: (BuildContext context, int index) {
                  User user = perfilService.listaUser().elementAt(index);

                  //  Object avatar = user.icon == null
                  //     ? NetworkImage('https://cdn.pixabay.com/photo/2022/10/23/10/09/dumbbell-7540929__340.png')
                  //     : ;
                  

                  return Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: ListTile(
                        title: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            //  Nome do usuario
                            Column(
                              children: [
                                Stack(children: [
                                  
//                                   Container(
//                                     width: 130,
//                                     height: 130,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                             width: 4,
//                                             color:
//                                                 Theme.of(context).canvasColor),
//                                         boxShadow: [
//                                           BoxShadow(
//                                               spreadRadius: 2,
//                                               blurRadius: 10,
//                                               color:
//                                                   Colors.black.withOpacity(0.1))
//                                         ],
//                                         shape: BoxShape.circle,
//                                         image: DecorationImage(
//                                             fit: BoxFit.cover,
//                                             image: user.icon ,
                                               
// )),
//                                   ),
                           CircleAvatar(
                           radius: 80.0,
                           backgroundImage: user.icon == null ?
                            AssetImage('assets/imgs/logo_app.png'): 
                            FileImage(File(user.icon.path)) as ImageProvider
                           ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 4,
                                                color: Theme.of(context)
                                                    .canvasColor),
                                            color: Theme.of(context)
                                                .backgroundColor),
                                        child: IconButton(
                                          // alignment: Alignment.topCenter,
                                          padding: EdgeInsets.only(
                                              bottom: 4, left: 3, top: 2),
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             AtualizarPerfil()));
                                          },
                                        ),
                                      ))
                                ]),
                                SizedBox(height: 10),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      user.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    )
                                  ],
                                ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //'Objetivo'
                                  new Text(
                                    'Nascimento',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.grey.
                                        fontSize: 20),
                                  ),
                                  SizedBox(width: 5),
                                  // Objetivo
                                  new Text(
                                    user.dataNasc,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  new Text(
                                    'Peso atual:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  new Text(
                                    "${user.pesoAtual}kg",
                                    style: TextStyle(fontSize: 23),
                                  )
                                ],
                              ),
                            ),

                            SizedBox(height: 10),

                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).cardColor),
                              child: Row(
                                children: [
                                  Text(
                                    'Bio:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    user.textBio,
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            ),

                            new Container(
                              padding: EdgeInsets.only(top: 25, bottom: 25),
                              child: Divider(height: 5),
                            ),

                            //  OUTRAS AÇÕES
                          ],
                        ),
                      )
                      );
                },
              ),
            ),
      bottomNavigationBar: barraInferior(),
    );
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

  AppBar appaBarHome(Text texto) {
    return AppBar(
        automaticallyImplyLeading: false, //Esconde o ícone original (menu)

        centerTitle: true,
        title: texto,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: FaIcon(FontAwesomeIcons.bars),
              onPressed: () => Scaffold.of(context).openDrawer());
        }));
  }
}
