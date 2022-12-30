import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BarraSuperior extends AppBar {

  BarraSuperior() : super(
            automaticallyImplyLeading: false, //Esconde o ícone original (menu)
            // centerTitle: true,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(icon: FaIcon(FontAwesomeIcons.bars),
               onPressed: () => Scaffold.of(context).openDrawer());
            }),
          

            );
           
}