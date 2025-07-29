import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/bloc/habit_creation/habit_creation_cubit.dart';
import 'package:hadeet/models/today/repeat_type.dart';
import 'package:hadeet/ui/habit_creation/components/repeat_type_button.dart';
import 'package:hadeet/ui/login/components/default_textfield.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/assets/images.dart';
import 'package:hadeet/uikit/themes/_app_colors.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class HabitCreationBody extends StatelessWidget {
  const HabitCreationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitCreationCubit>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Bounce(
                      onTap: () {
                        HapticFeedback.lightImpact();
                      },
                      child: SvgPicture.asset(
                        AppIcons.closeSquare,
                        width: 28,
                        height: 28,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'New Habit',
                    style: CustomTheme.of(context)
                        .typography
                        .title20Bold
                        .copyWith(
                            color: CustomTheme.of(context).colors.neutral4),
                  ),
                  const Spacer(),
                  Bounce(
                      onTap: () {
                        HapticFeedback.lightImpact();
                      },
                      child: Text(
                        'Save',
                        style: CustomTheme.of(context)
                            .typography
                            .headline16Bold
                            .copyWith(
                                color: CustomTheme.of(context).colors.primary1),
                      )),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                    child: Image.asset(
                      AppImages.createNewHabit,
                      width: 216,
                      height: 112,
                    ),
                  ),
                ),
                Text('Name',
                    style: CustomTheme.of(context)
                        .typography
                        .body14Semibold
                        .copyWith(
                            color: CustomTheme.of(context).colors.neutral3)),
                const SizedBox(
                  height: 12,
                ),
                DefaultTextField(
                  isTextInput: cubit.state.isKeyboardActive,
                  onChangeText: (value) {},
                  onTap: cubit.onInputTap,
                  color: Color(cubit.state.chosenColor),
                  hintText: 'Enter name your habit',
                ),
                const SizedBox(
                  height: 20,
                ),
                Bounce(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Color theme',
                        style: CustomTheme.of(context)
                            .typography
                            .body14Semibold
                            .copyWith(
                                color: CustomTheme.of(context).colors.neutral3),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(cubit.state.chosenColor)),
                      )
                    ],
                  ),
                ),
                AnimatedCrossFade(
                    firstChild: const SizedBox(),
                    secondChild: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(),
                    ),
                    crossFadeState: cubit.state.isChoosingColors
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 400)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bounce(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: CustomTheme.of(context).colors.semantic4,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppIcons.calendar,
                                width: 24,
                                height: 24,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              '+ Add date',
                              style: CustomTheme.of(context)
                                  .typography
                                  .body14Semibold
                                  .copyWith(
                                      color: CustomTheme.of(context)
                                          .colors
                                          .semantic4),
                            ),
                          ],
                        ),
                      ),
                      Bounce(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: AppColors.gradient3,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppIcons.star,
                                width: 24,
                                height: 24,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              '+ Add amount',
                              style: CustomTheme.of(context)
                                  .typography
                                  .body14Semibold
                                  .copyWith(
                                      color: CustomTheme.of(context)
                                          .colors
                                          .semantic2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: RepeatTypeButton(
                          title: 'Daily',
                          isSelected:
                              cubit.state.repeatType == RepeatType.daily,
                          onTap: () {}),
                    ),
                    SizedBox(
                      width: 0.04 * MediaQuery.of(context).size.width,
                    ),
                    Expanded(
                      child: RepeatTypeButton(
                          title: 'Weekly',
                          isSelected:
                              cubit.state.repeatType == RepeatType.weekly,
                          onTap: () {}),
                    ),
                    SizedBox(
                      width: 0.04 * MediaQuery.of(context).size.width,
                    ),
                    Expanded(
                      child: RepeatTypeButton(
                          title: 'Monthly',
                          isSelected:
                              cubit.state.repeatType == RepeatType.weekly,
                          onTap: () {}),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
