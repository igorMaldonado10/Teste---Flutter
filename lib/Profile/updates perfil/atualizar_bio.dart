import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/Profile/model/perfil_model.dart';
import 'package:teste/Profile/perfil_service.dart';

class UpdateBioProfile extends StatefulWidget {
  // const UpdateBioProfile({Key? key}) : super(key: key);
  final int id = 0;
  final User user;

  UpdateBioProfile(this.user);

  @override
  State<UpdateBioProfile> createState() => _UpdateBioProfileState();
}

class _UpdateBioProfileState extends State<UpdateBioProfile> {
  final bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bioController.text = widget.user.textBio;
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
                  'Altere o texto da bio',
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

            addTexForm('Bio', bioController),

            Container(
              width: 325,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    atualizarBio();

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Perfil atualizado'),
                      ],
                    )));
                    // setState(() {
                    //   widget.user.textBio = bioController.text;

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

  void atualizarBio() {
    User user = Provider.of<PerfilService>(context, listen: false)
        .perfilView
        .elementAt(widget.id);

    Provider.of<PerfilService>(context, listen: false)
        .atualizarBio(user, bioController.text);
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
