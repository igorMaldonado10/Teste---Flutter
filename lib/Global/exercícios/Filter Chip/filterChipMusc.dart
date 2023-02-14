import 'package:flutter/material.dart';
import 'package:teste/Global/treino_2.0/treino_model2.dart';

class FilterChipExercMusc extends StatefulWidget {
   final List<String> items_filters;
  final void Function(String value) onSelectedChange;
  final Treino_dois? treino;

  // const FilterChipExerc({Key? key}) : super(key: key);
  FilterChipExercMusc({required this.items_filters, this.treino, required this.onSelectedChange});

  @override
  State<FilterChipExercMusc> createState() => _FilterChipExercMuscState();
}

class _FilterChipExercMuscState extends State<FilterChipExercMusc> {
    String selected = '';


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: List.from(widget.items_filters.map((itemSelec) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputChip(
                  label: Text(itemSelec),
                  selected: itemSelec == selected,
                  pressElevation: 1,
                  backgroundColor:
                      Theme.of(context).backgroundColor.withOpacity(.4),
                  selectedColor: Theme.of(context).backgroundColor,
                  onDeleted: (() {
                    setState(() {
                      selected = null.toString();
                    });
                  }),
                  onPressed: () {
                    setState(() {
                      selected = itemSelec;
                      widget.onSelectedChange(itemSelec);
                      print(selected);
                    });
                  },
                ),
              )
              )
              )
              ),
            
            );
  }
}
