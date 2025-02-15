import 'package:bounce/bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/ui/login/components/button_primary_text.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/assets/images.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class WhatTimeSleepBody extends StatelessWidget {
  const WhatTimeSleepBody(
      {super.key,
      required this.onChangeTime,
      required this.sleepTime,
      required this.onContinue});

  final DateTime sleepTime;
  final Function(bool, int, String) onChangeTime;
  final Function() onContinue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: CustomTheme.of(context).colors.primary1,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5 + 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.secondPurpleWave),
                        fit: BoxFit.contain)),
              )),
          Positioned(
            top: (220 / 812) * MediaQuery.of(context).size.height,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.night,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(AppImages.darkWave),
          ),
          Positioned(
            bottom: (104 / 812) * MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: SizedBox(
                height: 210,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 90) * 0.5,
                      child: CupertinoPicker(
                        magnification: 1.0,
                        itemExtent: 70,
                        onSelectedItemChanged: (int value) {
                          onChangeTime(true, value, 'sleep');
                        },
                        selectionOverlay: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: CustomTheme.of(context)
                                          .colors
                                          .neutral4
                                          .withOpacity(0.5),
                                      width: 1),
                                  bottom: BorderSide(
                                      color: CustomTheme.of(context)
                                          .colors
                                          .neutral4
                                          .withOpacity(0.5),
                                      width: 1))),
                        ),
                        looping: false,
                        scrollController: FixedExtentScrollController(
                            initialItem: sleepTime.hour),
                        children: List.generate(24, (int index) {
                          return Center(
                            child: Text(
                              index.toString().length >= 2
                                  ? index.toString()
                                  : '0${index.toString()}',
                              style: CustomTheme.of(context)
                                  .typography
                                  .title30Bold
                                  .copyWith(
                                      color: sleepTime.hour == index
                                          ? CustomTheme.of(context)
                                              .colors
                                              .primary1
                                          : CustomTheme.of(context)
                                              .colors
                                              .neutral4
                                              .withOpacity(0.5)),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 90) * 0.5,
                      child: CupertinoPicker(
                        magnification: 1.0,
                        itemExtent: 70,
                        onSelectedItemChanged: (int value) {
                          onChangeTime(false, value, 'sleep');
                        },
                        looping: false,
                        selectionOverlay: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: CustomTheme.of(context)
                                          .colors
                                          .neutral4
                                          .withOpacity(0.5),
                                      width: 1),
                                  bottom: BorderSide(
                                      color: CustomTheme.of(context)
                                          .colors
                                          .neutral4
                                          .withOpacity(0.5),
                                      width: 1))),
                        ),
                        scrollController: FixedExtentScrollController(
                            initialItem: sleepTime.minute),
                        children: List.generate(59, (int index) {
                          return Center(
                            child: Text(
                              index.toString().length >= 2
                                  ? index.toString()
                                  : '0${index.toString()}',
                              style: CustomTheme.of(context)
                                  .typography
                                  .title30Bold
                                  .copyWith(
                                      color: sleepTime.minute == index
                                          ? CustomTheme.of(context)
                                              .colors
                                              .primary1
                                          : CustomTheme.of(context)
                                              .colors
                                              .neutral4
                                              .withOpacity(0.5)),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ButtonPrimaryText(
                    text: 'Continue',
                    onTap: () {
                      onContinue();
                    }),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Bounce(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AppIcons.arrowLeftSquare,
                      width: 28,
                      height: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    'What time do you\nusually wake up?',
                    style: CustomTheme.of(context)
                        .typography
                        .title30Bold
                        .copyWith(
                            color: CustomTheme.of(context).colors.neutral4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
