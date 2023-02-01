import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teste/Profile/model/perfil_model.dart';
import 'package:teste/Profile/perfil_page.dart';
import 'package:teste/Profile/perfil_service.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';
import 'package:image_picker/image_picker.dart';

class CadastroPerfil extends StatefulWidget {
  // const CadastroTreino({Key? key}) : super(key: key);

  @override
  State<CadastroPerfil> createState() => _CadastroPerfilState();
}

class _CadastroPerfilState extends State<CadastroPerfil> {
  final name = TextEditingController();
  final dataNasc = TextEditingController();
  final pesoAtual = TextEditingController();
  final icon = TextEditingController();
  final textBio = TextEditingController();
  final sobrenome = TextEditingController();

  // XFile? foto;
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appaBarHome(Text('Cadastro Perfil')),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        // Container do Form
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Título
              new Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 45),
                child: Text(
                  'Cadastro de Perfil',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // Campos do formulários
              // Container(
              //   padding: EdgeInsets.all(5),
              //   // margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              //   child: ListTile(
              //     leading: new ClipRRect(
              //       borderRadius: BorderRadius.circular(50),
              //       child:  Container(child: foto != null ? Image.file(File(foto!.path)) : null,
              //       height: 75,
              //       width: 75,
              //       )
              //     ),
              //     title: Column(
              //       children: [
              //         Text(
              //           'Adicione uma foto de perfil',
              //           style: TextStyle(fontSize: 15),
              //         ),
              //       ],
              //     ),
              //     // onTap:
              //     // () => selecionarFoto(),
              //     trailing: Icon(Icons.photo_camera_back)

              //   ),
              // ),
              imageProfile(),
              SizedBox(height: 20),
              addTexForm('Nome', name),
              addTexForm('Sobrenome', sobrenome),
              addTexForm('Data de nascimento', dataNasc),
              addTexForm('Peso atual', pesoAtual),
              // addTexForm('URL do icon', icon),
              addTexForm('Bio', textBio),

              // SizedBox(height: 15),

              // Botões
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão cadastrar
                  new Builder(builder: (BuildContext context) {
                    return ElevatedButton(
                        onPressed: () {
                          cadastrar();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: new Text('Cadastrar'),
                        ));
                  }),

                  // Botão limpar
                  new Builder(builder: (BuildContext context) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: lightColorScheme.error),
                        onPressed: () {
                          limpar();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: new Text(
                            'Limpar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ));
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // selecionarFoto() async {
  //   final ImagePicker picker = ImagePicker();

  //   try {
  //     XFile? file = await picker.pickImage(source: ImageSource.gallery);
  //     if (file != null)
  //       setState(() {
  //         foto = file;
  //       });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Widget imageProfile() {
    return Stack(
      children: [
        CircleAvatar(
            radius: 80.0,
            backgroundImage: _imageFile == null
                ? AssetImage('assets/imgs/logo_app.png')
                : FileImage(File(_imageFile!.path)) as ImageProvider),
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(width: 4, color: Theme.of(context).canvasColor),
                color: Theme.of(context).backgroundColor),
            child: IconButton(
              //  alignment: Alignment.topCenter,
              padding: EdgeInsets.only(bottom: 4, left: 3, top: 5, right: 3),
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: ((builder) => bottomSheet()));
              },
            ),
          ),
        )
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Escolha a sua foto',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera)),
              Text('Câmera'),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image)),
              Text('Galleria'),
              SizedBox(height: 5),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  //  Retorna a estrutura do campo input
  Container addTexForm(String nomoDoCampo, TextEditingController controller) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        // recebe o valor dos campos
        controller: controller,

        decoration: InputDecoration(
          labelText: nomoDoCampo, // Borda do Input
          border: OutlineInputBorder(borderSide: BorderSide()),
        ),
      ),
    );
  }

  // método de Cadastrar
  void cadastrar() {
    // Chamei o objeto que possui os métodos referente ao perfil
    PerfilService perfilService = new PerfilService();

    // Guardar o último ID cadastrado
    int id = perfilService.listaUser().length;

    User user = User(
      id: id,
      name: name.text,
      sobrenome: sobrenome.text,
      dataNasc: dataNasc.text,
      pesoAtual: pesoAtual.text,
      icon: _imageFile!
      // foto!
      ,
      textBio: textBio.text,
    );

// Envia o objeto preenchido para adicionar na lista
    String mensagem = perfilService.cadastrarPerfil(user);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(mensagem),
        ],
      ),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    ));

    // Redireciona para a tela de busca
    Future.delayed(Duration(milliseconds: 2500), () {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: ((context) => PerfilPage())));
      Navigator.pop(context);
    });
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

  // Limpar campos
  void limpar() {
    name.text = '';
    dataNasc.text = '';
    pesoAtual.text = '';
    // icon.text = '';
    textBio.text = '';
  }
}
