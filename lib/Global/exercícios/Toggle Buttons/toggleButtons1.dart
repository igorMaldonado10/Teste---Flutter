import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:teste/Global/exerc%C3%ADcios/Toggle%20Buttons/class_GetX_bool_for_string.dart';
import 'package:teste/Global/exerc%C3%ADcios/model/exercises.dart';

class ToggleButtons1 extends StatefulWidget {
  // final List<String> items;
  // final void Function(String value) onSelectedChange;
  // const ToggleButtons1(
  //     {Key? key, required this.items, required this.onSelectedChange})
  //     : super(key: key);
  final Exercises? exercises;
  // final TextEditingController? tipo;
  ToggleButtons1({this.exercises});

  @override
  State<ToggleButtons1> createState() => _ToggleButtons1State();
}

class _ToggleButtons1State extends State<ToggleButtons1> {
  List<bool> isSelected = [false, false, true];
  // String opcao1 = 'Máquina';
  // String opcao2 = 'Hálteres';
  // String opcao3 = 'Peso do corpo';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());

    return Container(
      color: Theme.of(context).backgroundColor.withOpacity(.1),
      child: ToggleButtons(
        fillColor: Theme.of(context).backgroundColor,
        selectedColor: Colors.white,
        color: Theme.of(context).backgroundColor,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Text('Máquina', style: TextStyle(fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Text('Hálteres', style: TextStyle(fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Text('Peso do corpo', style: TextStyle(fontSize: 14)),
          )
        ],
        isSelected: isSelected,
        onPressed: (newindex) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < isSelected.length;
                buttonIndex++) {
              if (buttonIndex == newindex) {
                isSelected[buttonIndex] = true;
                controller.selectTipoExerc(newindex);
              } else {
                isSelected[buttonIndex] = false;
              }
            }
            ;
          });
        },
      ),
    );
  }
}
