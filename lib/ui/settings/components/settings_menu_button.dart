import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/uikit/themes/_app_colors.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class SettingsMenuButton extends StatelessWidget {
  const SettingsMenuButton(
      {super.key,
      required this.icon,
      required this.isActive,
      required this.title,
      required this.onTap});

  final String icon;
  final String title;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: isActive ? AppColors.gradient5 : null),
      clipBehavior: Clip.hardEdge,
      child: Bounce(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: isActive ? AppColors.gradient1 : null),
              child: SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(title,
                  style: CustomTheme.of(context)
                      .typography
                      .headline16Semibold
                      .copyWith(
                          color: isActive
                              ? CustomTheme.of(context).colors.primary1
                              : CustomTheme.of(context).colors.neutral4)),
            )
          ],
        ),
      ),
    );
  }
}
