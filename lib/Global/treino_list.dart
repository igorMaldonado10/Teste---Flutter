import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:teste/Global/provider/treinoProvider.dart';
import 'package:teste/Global/routes/app_routes.dart';
import 'package:teste/Global/treino_arq.dart';
import 'package:teste/Global/treino_tile.dart';
import 'package:teste/model/treino_model.dart';
import 'package:teste/view/recursos/homeScreen.dart';
import 'package:teste/view/recursos/menuDrawer.dart';

class TreinoList extends StatefulWidget {
  @override
  State<TreinoList> createState() => _TreinoListState();
}

class _TreinoListState extends State<TreinoList> {
  @override
  Widget build(BuildContext context) {
    // exportação da lista de ARQuivos
    // LISTEN serve para mesmo ele sendo notificado ele não realiza uma modificacao na ínterface
    final treino = Provider.of<TreinosProvider>(context, listen: true);

    return Scaffold(
        appBar: appaBarHome(Text('Treino')),
        drawer: MenuDrawer(),
        body: ListView.builder(
            itemCount: treino.count,
            // recebo o índice e o contexto do elemento que vou retornar, eu posso criar por ex. um text
            itemBuilder: (context, index) => TreinoTile(treino.byIndex(index))),
        floatingActionButton: FloatingActionButton(
            child: FaIcon(FontAwesomeIcons.plus),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.TREINO_FORM);
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
