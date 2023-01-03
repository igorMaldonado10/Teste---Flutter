import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Global/routes/app_routes.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';


import '../models/treino_model.dart';

class TreinoTile extends StatelessWidget {
  final Treino treino;

  // Por já ter todos os parâmetros como finais eu posso colocar como final
  // construtor desse componente UserTile
  const TreinoTile(this.treino);

  @override
  Widget build(BuildContext context) {
    final avatar = treino.icon == null || treino.icon.isEmpty
        ? CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFF9B4501),
            child: FaIcon(
              FontAwesomeIcons.dumbbell,
              color: Colors.white,
              size: 30,
            ))
        : CircleAvatar(
            backgroundImage: NetworkImage(treino.icon),
          );

    return ListTile(
      leading: avatar,
      title: Text(treino.tipoDeTreino),
      subtitle: Text(treino.dataDoTreino),
      trailing: Container(
        width: 100,
        // height: 25,
        child: Row(
          children: [
            // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined)),
            IconButton(
                iconSize: 25,
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: lightColorScheme.error,
                )),

            IconButton(
                iconSize: 25,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.TREINO_FORM,
                    arguments: treino,
                    );
                },
                icon: Icon(
                  Icons.edit,
                  // color: darkColorScheme.secondary,
                )),
            // IconButton(
            //     onPressed: () {

            //     },
            //     icon: Icon(Icons.more_vert_rounded))
          ],
        ),
      ),
    );
  }
}
