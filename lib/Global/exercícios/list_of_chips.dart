import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListOfChips extends StatefulWidget {
  final List<String> items;
  final void Function(String value) onSelectedChange;
  const ListOfChips(
      {Key? key, required this.items, required this.onSelectedChange})
      : super(key: key);

  @override
  State<ListOfChips> createState() => _ListOfChipsState();
}

class _ListOfChipsState extends State<ListOfChips> {
  String selected = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 120),
          child: Text(
            'Grupo muscular',
          ),
        ),
        Row(
            children: widget.items
                .map((itemSelec) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputChip(
                        label: Text(itemSelec),
                        selected: itemSelec == selected,
                        pressElevation: 1,
                        backgroundColor:
                            Theme.of(context).backgroundColor.withOpacity(.4),
                        selectedColor: Theme.of(context).backgroundColor,
                        deleteIcon: Icon(Icons.highlight_remove_outlined),
                        onDeleted: (() {
                          setState(() {
                            selected = '';
                          });
                        }),
                        onPressed: () {
                          setState(() {
                            selected = itemSelec;
                            widget.onSelectedChange(
                              itemSelec
                            );
                            print(selected);
                          });
                        },
                      ),
                    ))
                .toList()),
      ],
    );
  }
}
