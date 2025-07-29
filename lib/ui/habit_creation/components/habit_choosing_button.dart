import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class HabitChoosingButton extends StatelessWidget {
  const HabitChoosingButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.description,
      required this.color,
      required this.imagePath});

  final Color color;
  final String imagePath;
  final String title;
  final String description;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: CustomTheme.of(context).colors.neutral1,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: AssetImage(imagePath))),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: CustomTheme.of(context)
                        .typography
                        .headline16Bold
                        .copyWith(
                            color: CustomTheme.of(context).colors.neutral4)),
                Text(
                  description,
                  style: CustomTheme.of(context)
                      .typography
                      .body14Semibold
                      .copyWith(color: CustomTheme.of(context).colors.neutral3),
                )
              ],
            ),
            Spacer(),
            Bounce(
                onTap: onTap,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                  child: Center(
                      child: Icon(
                    Icons.add,
                    size: 12,
                    color: CustomTheme.of(context).colors.neutral4,
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
