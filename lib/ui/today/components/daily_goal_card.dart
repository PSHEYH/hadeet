import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/assets/images.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class DailyGoalCard extends StatelessWidget {
  const DailyGoalCard(
      {super.key,
      required this.text,
      required this.color,
      required this.count,
      required this.onTap,
      required this.gradient,
      required this.digitColor});

  final Function() onTap;
  final int count;
  final Color color;
  final LinearGradient gradient;
  final String text;
  final Color digitColor;

  @override
  Widget build(BuildContext context) {
    return Bounce(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: CustomTheme.of(context).colors.neutral1,
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: AssetImage(
                      AppImages.pencils,
                    ))),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                text,
                style: CustomTheme.of(context)
                    .typography
                    .headline16Bold
                    .copyWith(color: CustomTheme.of(context).colors.neutral4),
              ),
              const Spacer(),
              Text(
                count.toString(),
                style: CustomTheme.of(context)
                    .typography
                    .headline16Bold
                    .copyWith(color: digitColor),
              ),
              const SizedBox(
                width: 16,
              ),
              SvgPicture.asset(
                AppIcons.arrowRightSquare,
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
        ));
  }
}
