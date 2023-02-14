import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/Profile/model/perfil_model.dart';

import '../perfil_service.dart';

class UpadateDateProfile extends StatefulWidget {
  // const UpadateDateProfile({Key? key}) : super(key: key);
  final User user;
  final int id = 0;
  UpadateDateProfile(this.user);

  @override
  State<UpadateDateProfile> createState() => _UpadateDateProfileState();
}

class _UpadateDateProfileState extends State<UpadateDateProfile> {
  final birthdayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    birthdayController.text = widget.user.dataNasc;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 600,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Altere a data',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_outlined))
              ],
            ),

            Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Divider(),
            ),
            SizedBox(height: 20),

            addTexForm('Aniversário', birthdayController),

            Container(
              width: 325,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    atualizarData();

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Perfil atualizado'),
                      ],
                    )));
                    // setState(() {
                    //   widget.user.dataNasc = birthdayController.text;

                    //   Navigator.pop(context);
                    // });
                  },
                  child: Text(
                    'Alterar',
                    style: TextStyle(fontSize: 23),
                  )),
            )
            // SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void atualizarData() {
    User user = Provider.of<PerfilService>(context, listen: false)
        .perfilView
        .elementAt(widget.id);

    Provider.of<PerfilService>(context, listen: false)
        .atualizarNascimento(user, birthdayController.text);
  }

  Container addTexForm(String nomoDoCampo, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.only(right: 15, left: 15),
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        // autofillHints:  ,
        // recebe o valor dos campos
        controller: controller,

        decoration: InputDecoration(
          labelText: nomoDoCampo,

          // Borda do Input
          // border: OutlineInputBorder(borderSide: BorderSide()),
        ),
      ),
    );
  }
}
