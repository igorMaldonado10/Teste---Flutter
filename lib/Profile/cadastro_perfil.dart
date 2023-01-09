import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/Profile/perfil_model.dart';
import 'package:teste/Profile/perfil_page.dart';
import 'package:teste/Profile/perfil_service.dart';
import 'package:teste/view/recursos/menuDrawer.dart';
import 'package:teste/view/recursos/thema/color_schemes.g.dart';

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
              color: Colors.grey.shade200),
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
              addTexForm('Nome', name),
              addTexForm('Data de nascimento', dataNasc),
              addTexForm('Peso atual', pesoAtual),
              addTexForm('URL do icon', icon),

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

  //  Retorna a estrutura do campo input
  Container addTexForm(String nomoDoCampo, TextEditingController controller) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        // recebe o valor dos campos
        controller: controller,

        decoration: InputDecoration(
          labelText: nomoDoCampo,

          // Borda do Input
          border: OutlineInputBorder(borderSide: BorderSide()),
        ),
      ),
    );
  }

  // método de Cadastrar
  void cadastrar() {
    PerfilService perfilService = new PerfilService();

    // Guardar o último ID cadastrado
    int ultimoID = perfilService.listaUser().length;

    User user = User(
      id: ultimoID + 1,
      name: name.text,
      dataNasc: dataNasc.text,
      pesoAtual: pesoAtual.text,
      icon: icon.text,
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PerfilPage()));
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
    icon.text = '';
    textBio.text = '';
  }
}
