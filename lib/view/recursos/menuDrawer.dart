import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/view/recursos/homeScreen.dart';

class MenuDrawer extends StatelessWidget {
// Dados vindos do banco de dados(simulação)
  String usuario = 'Igor Maldonado';
  String email = 'igor_maldonado77@gmail.com';
  // String fotoPerfil = 'img/foto.jpg';

  Text mostrarTitulo(String texto) {
    return Text(
      texto,
      style: TextStyle(fontSize: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //  Foto e informações do usuário
          DrawerHeader( 
           decoration: BoxDecoration(
            color: Color.fromRGBO(211, 111, 47, 100)
           ),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              new Text(usuario),
              new Text(email)
            ],
            
           )
          ),

           // Perfil
          new ListTile(
            title: mostrarTitulo('Perfil'),
            subtitle: Text('Editar Informações'),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(FontAwesomeIcons.solidCircleUser,
            size: 32),

            onTap: () {
              
            },
          ), 


          ListTile(
              title: mostrarTitulo('Home'),
              subtitle: Text('Página inicial'),
              leading: FaIcon(
                FontAwesomeIcons.home,
              ),
              trailing: FaIcon(FontAwesomeIcons.chevronRight),
              onTap: () {
                //  Vai para a página Home
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
          new ListTile(
            title: mostrarTitulo('Treino'),
            subtitle: Text('Gerenciar treinos'),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.dumbbell,
              size: 32,
            ),

            // Vai ppara a página busca 
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Busca()));
            },
          ),

         

          new ListTile(
            title: mostrarTitulo('IMC'),
            subtitle: Text('Índice de Massa Corporal'),
            leading: FaIcon(
              FontAwesomeIcons.calculator,
              size: 32,
            ),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            onTap: (() {
              // Navigator.push(
              //     context, MaterialPageRoute(
              //       builder: (context) => Home(

              //       )));
            }),
          ),

          new ListTile(
            title: mostrarTitulo('logout'),
            subtitle: Text('Sair do Sistema'),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(FontAwesomeIcons.signOutAlt,
                color: Colors.grey, size: 32),

            // Vai para a página Logout
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Home()
              //     )
              //     );
            },
          )
        ],
      ),
    );
  }
}