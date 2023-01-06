import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/view/recursos/menuDrawer.dart';

class CadastroTreino extends StatefulWidget {
  // const CadastroTreino({Key? key}) : super(key: key);

  @override
  State<CadastroTreino> createState() => _CadastroTreinoState();
}

class _CadastroTreinoState extends State<CadastroTreino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: appaBarHome(Text('Cadastro Treino')) ,
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        // Form
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Título
              new Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Cadastro de Treino',
                  style: TextStyle(
                    fontSize: 24
                  ),),
              ),

              // Campos do formulários

              SizedBox(height: 15),

              // Botões

            ],
          ),
        ),
      ),
    );
  }

  //  Retorna a estrutura do campo input

  // método de Cadastrar

  // Limpar campos

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
