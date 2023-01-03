import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Gerenciador de estado
// final tema = ValueNotifier(ThemeMode.light);

class BarraSuperior extends StatefulWidget {
  const BarraSuperior({Key? key}) : super(key: key);

  @override
  State<BarraSuperior> createState() => _BarraSuperiorState();
}

class _BarraSuperiorState extends State<BarraSuperior> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false, //Esconde o ícone original (menu)
        // centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: FaIcon(FontAwesomeIcons.bars),
              onPressed: () => Scaffold.of(context).openDrawer());
        }));
  }
}
