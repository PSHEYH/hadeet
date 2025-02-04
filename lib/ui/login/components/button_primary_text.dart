import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class ButtonPrimaryText extends StatelessWidget {
  const ButtonPrimaryText({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: CustomTheme.of(context).colors.primary1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: Text(
        text,
        style: CustomTheme.of(context)
            .typography
            .headline16Bold
            .copyWith(color: CustomTheme.of(context).colors.neutral4),
      )),
    ));
  }
}
