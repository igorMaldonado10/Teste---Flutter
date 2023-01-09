import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Profile/editar_perfil.dart';
import 'package:teste/Profile/perfil_model.dart';
import 'package:teste/Profile/perfil_service.dart';
import 'package:teste/view/recursos/barraSuperior.dart';
import 'package:teste/view/recursos/home/homeScreen.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';

// final tema = ValueNotifier(ThemeMode.light)

class PerfilPage extends StatefulWidget {
  // const EditTreino({Key? key}) : super(key: key);

  // Guardar o ID do contato selecionado
  // final int id;

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

    return Scaffold(
      // Barra de título
      appBar: appaBarHome(Text('Perfil')),
      // Menu (Hambúrguer)
      drawer: MenuDrawer(),

      // Corpo
      body: ListView.builder(
        itemCount: perfilService.listaUser().length,
        itemBuilder: (BuildContext context, int index) {
          
          User user = perfilService.listaUser().elementAt(index);

          final avatar = user.icon == null || user.icon.isEmpty
              ? CircleAvatar(
                  radius: 75,
                  backgroundColor: Color(0xFF9B4501),
                  child: FaIcon(
                    FontAwesomeIcons.dumbbell,
                    color: Colors.white,
                    size: 65,
                  ))
              : CircleAvatar(
                  backgroundImage: NetworkImage(user.icon),
                );

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
                    Container(
                      // padding: EdgeInsets.all(10),
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        child: avatar,
                        minRadius: 50,
                        maxRadius: 75,
                      ),
                    ),
                    SizedBox(height: 10),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        )
                      ],
                    ),
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
                        'Data de nascimento:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // color: Colors.grey.
                            fontSize: 20),
                      ),

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
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Text(
                        'Peso atual:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                  color: Colors.grey.shade200,
                  child: Row(
                    children: [
                      Text('Bio:',  
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                     ),
                     
                     SizedBox(width: 5),

                     Text(user.textBio,
                     style: TextStyle(
                      fontSize: 18
                     ),)
                    ],
                  ),
                ),

                new Container(
                  padding: EdgeInsets.only(top: 25, bottom: 25),
                  child: Divider(height: 5),
                ),

                // Ações
                // new Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     // delete
                //     IconButton(
                //         onPressed: () {
                //           // removerTreino();
                //         },
                //         icon: Icon(
                //           Icons.delete,
                //           color: lightColorScheme.error,
                //           size: 50,
                //         )),
                //     SizedBox(
                //       width: 10,
                //       height: 10,
                //     ),

                //     Text(
                //       'Deletar treino',
                //       style: TextStyle(
                //           color: lightColorScheme.error,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold),
                //     )
                //   ],
                // )
              ],
            ),
            )
          );
        },
      ),

      // Botão flutuante
      floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.pen),
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => PerfilForm(
                          
            //             )));
          }),
    );
  }

  // void removerTreino() {
  //   String mensagem = treinoService.removerTreino(widget.id);

  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Text(mensagem),
  //     ],
  //   )));

  //   Future.delayed(Duration(milliseconds: 2500), () {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: ((context) => TreinoList2())));
  //   });
  // }

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
