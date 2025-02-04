import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onTap, required this.icon});

  final Function() onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Bounce(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: CustomTheme.of(context).colors.neutral1),
          boxShadow: [
            BoxShadow(
                blurRadius: 16,
                offset: const Offset(0, 8),
                color: Colors.black.withOpacity(0.5))
          ]),
      child: Center(
          child: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
      )),
    ));
  }
}
