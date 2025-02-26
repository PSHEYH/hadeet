import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/ui/login/components/button_primary_text.dart';
import 'package:hadeet/ui/login/components/goal_count_textfield.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class HabitBody extends StatelessWidget {
  const HabitBody(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.goalName,
      required this.node,
      required this.onTextFieldTap,
      required this.isTextFieldActive,
      required this.onContinue});

  final String imagePath;
  final String title;
  final String goalName;
  final FocusNode node;
  final Function() onTextFieldTap;
  final bool isTextFieldActive;
  final Future Function() onContinue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Bounce(
                    child: SvgPicture.asset(
                  AppIcons.arrowLeftSquare,
                  width: 28,
                  height: 28,
                )),
              ],
            ),
          ),
          Image.asset(
            "assets/images/$imagePath",
            width: isTextFieldActive
                ? 240
                : MediaQuery.of(context).size.width - 40,
            height: isTextFieldActive
                ? 240
                : MediaQuery.of(context).size.width - 40,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(title,
              style: CustomTheme.of(context)
                  .typography
                  .title30Bold
                  .copyWith(color: CustomTheme.of(context).colors.neutral4)),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Repeat everyday to form a habit',
            style: CustomTheme.of(context)
                .typography
                .body14Medium
                .copyWith(color: CustomTheme.of(context).colors.neutral2),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set your goal',
                  style: CustomTheme.of(context)
                      .typography
                      .body14Semibold
                      .copyWith(color: CustomTheme.of(context).colors.neutral3),
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    if (isTextFieldActive)
                      Container(
                        color: CustomTheme.of(context).colors.primary1,
                        height: 2,
                      ),
                    GoalCountTextField(
                      goal: goalName,
                      onTap: onTextFieldTap,
                      focusNode: node,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isTextFieldActive == false)
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ButtonPrimaryText(
                        text: 'Continue',
                        onTap: () {
                          onContinue();
                        }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
