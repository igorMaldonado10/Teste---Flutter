import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:teste/Profile/model/perfil_model.dart';
import 'package:teste/Profile/perfil_service.dart';

class UpdateNomeProfile extends StatefulWidget {
  final int id = 0;
  final User user;

  UpdateNomeProfile(this.user);
  // const UpdateNomeProfile({Key? key}) : super(key: key);

  @override
  State<UpdateNomeProfile> createState() => _UpdateNomeProfileState();
}

class _UpdateNomeProfileState extends State<UpdateNomeProfile> {
  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();

  // final PerfilService perfilService = new PerfilService();

  @override
  void initState() {
    super.initState();
    nomeController.text = widget.user.name;
    sobrenomeController.text = widget.user.sobrenome;
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
                  'Escolha outro nome',
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

            addTexForm('Nome', nomeController),
            addTexForm('Sobrenome', sobrenomeController),
            Container(
              width: 325,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.user.name = nomeController.text;
                      widget.user.sobrenome = sobrenomeController.text;

                      Navigator.pop(context);
                    });
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
