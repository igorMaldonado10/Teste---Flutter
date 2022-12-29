import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar (
    leading: Icon(Icons.menu),
    ),  
    body: 
    Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color.fromRGBO(186, 188, 190, 100)])),
      child: SingleChildScrollView(
        child: Stack(
          children: 
            [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                           alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              blurRadius: 25,
                              spreadRadius: 0.1)
                        ]),
                    child: Image.asset(
                      'assets/imgs/logo_app.png',
                      fit: BoxFit.fitHeight,
                    ),   ),
                ],
              ),
          ],
        ),
        
      ),
      
    ),
    bottomNavigationBar: BottomNavigationBar(items: [
      // ícone Home
      BottomNavigationBarItem(
      label: 'Home',
      icon: new IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
      },
      icon: new FaIcon(FontAwesomeIcons.houseChimney))),

      BottomNavigationBarItem(
      label: 'Perfil' ,
      icon: new IconButton(
      onPressed: (){},
      icon: FaIcon(FontAwesomeIcons.solidCircleUser)))
    ],
    ));
  }
}
