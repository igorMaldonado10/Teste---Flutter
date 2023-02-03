import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:teste/Profile/model/perfil_model.dart';
import 'package:teste/Profile/perfil_service.dart';

final tema = ValueNotifier(ThemeMode.light);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PerfilService perfilService = PerfilService();

  List imageList = [
    {'id': 1, 'image_path': "assets/imgs/image_pag_in.png"},
    {"id": 2, 'image_path': "assets/imgs/weights-3483560_1920.jpg"},
    {"id": 3, 'image_path': "assets/imgs/adult-1850925.jpg"},
    {"id": 4, 'image_path': "assets/imgs/barbell-1839086_1920.jpg"}
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

// int _opcaoSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    // User user = perfilService.perfilView.elementAt(0);

    return Scaffold(
      appBar: appaBarHome(Text('Home')),
      // drawer: MenuDrawer(),
      body: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  print(currentIndex);
                },
                child: CarouselSlider(
                    items: imageList
                        .map((item) => Image.asset(
                              item["image_path"],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ))
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 1,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        }
                        );
                      },
                    )),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    print(entry);
                    print(entry.key);
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 : 7,
                        height: 7,
                        margin: EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                                ? Theme.of(context).backgroundColor
                                : Theme.of(context).cardColor),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  AppBar appaBarHome(Text texto) {
    return AppBar(
      automaticallyImplyLeading: false, //Esconde o ícone original (menu)

      centerTitle: true,
      title: texto,
      actions: [
        Switch(
            activeColor: Theme.of(context).backgroundColor,
            value: tema.value == ThemeMode.dark,
            onChanged: (isDark) {
              setState(() {
                tema.value = isDark ? ThemeMode.dark : ThemeMode.light;
              });
            })
      ],
      // leading: Builder(builder: (BuildContext context) {
      //   return IconButton(
      //       icon: FaIcon(FontAwesomeIcons.bars),
      //       onPressed: () => Scaffold.of(context).openDrawer());
      // })
    );
  }
}
