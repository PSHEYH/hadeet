import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/ui/setup/components/animated_choice_button.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/assets/images.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class DoYouProcrastinateBody extends StatelessWidget {
  const DoYouProcrastinateBody(
      {super.key,
      required this.onContinue,
      required this.firstChoice,
      required this.secondChoice,
      required this.thirdChoice,
      required this.title});

  final Function() onContinue;
  final String title;
  final String firstChoice;
  final String secondChoice;
  final String thirdChoice;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.flagBoy),
        Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Bounce(
                    child: SvgPicture.asset(
                      AppIcons.arrowLeftSquare,
                      width: 28,
                      height: 28,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(title,
                      style: CustomTheme.of(context)
                          .typography
                          .title30Bold
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral4)),
                  const Spacer(),
                  AnimatedChoiceButton(
                    text: firstChoice,
                    onContinue: () {},
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AnimatedChoiceButton(
                    text: secondChoice,
                    onContinue: () {},
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AnimatedChoiceButton(
                      text: thirdChoice,
                      onContinue: () {
                        onContinue();
                      }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
