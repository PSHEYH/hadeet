
import 'package:flutter/material.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class HabitAvailableColorsList extends StatelessWidget {
  const HabitAvailableColorsList({super.key, required this.colors, required this.chosenColor, required this.changeColor});
  final List<int> colors;
  final int chosenColor;
  final Function(int) changeColor;


  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 24,
      children: [
        ...colors.map((e) => GestureDetector(
          onTap: (){
            changeColor(e);
          },
          child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: chosenColor == e ? Border.all(color: CustomTheme.of(context).colors.primary1, width: 2) : null
              ),
              child: Center(
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Color(e)),
                ),
              )
          ),
        ))
      ],
    );
  }
}
