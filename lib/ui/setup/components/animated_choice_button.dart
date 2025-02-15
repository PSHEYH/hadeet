import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class AnimatedChoiceButton extends StatefulWidget {
  const AnimatedChoiceButton(
      {super.key, required this.text, required this.onContinue});

  final String text;
  final Function() onContinue;

  @override
  State<AnimatedChoiceButton> createState() => _AnimatedChoiceButtonState();
}

class _AnimatedChoiceButtonState extends State<AnimatedChoiceButton> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {
        setState(() {
          isActive = !isActive;
          widget.onContinue();
        });
      },
      child: SizedBox(
          height: 104,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 8,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  height: 88,
                  decoration: BoxDecoration(
                      color: CustomTheme.of(context).colors.primary2,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: isActive ? -8 : 0,
                left: 0,
                right: 0,
                child: AnimatedContainer(
                  width: isActive ? 327 : 325,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isActive
                          ? CustomTheme.of(context).colors.primary1
                          : CustomTheme.of(context).colors.neutral1),
                  child: Center(
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: CustomTheme.of(context)
                          .typography
                          .headline16Bold
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral4),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
