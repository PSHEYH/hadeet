import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class RepeatTypeButton extends StatelessWidget {
  const RepeatTypeButton(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  final String title;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isSelected
                  ? CustomTheme.of(context).colors.primary1
                  : CustomTheme.of(context).colors.neutral3),
          child: Center(
            child: Text(
              title,
              style: CustomTheme.of(context)
                  .typography
                  .body14Semibold
                  .copyWith(color: CustomTheme.of(context).colors.neutral4),
            ),
          ),
        ));
  }
}
