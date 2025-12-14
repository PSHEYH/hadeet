import 'package:bounce/bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/bloc/habit_creation/habit_creation_cubit.dart';
import 'package:hadeet/models/today/repeat_type.dart';
import 'package:hadeet/ui/habit_creation/components/habit_available_colors_list.dart';
import 'package:hadeet/ui/habit_creation/components/habit_calendar_dialog.dart';
import 'package:hadeet/ui/habit_creation/components/habit_reminder_switcher.dart';
import 'package:hadeet/ui/habit_creation/components/repeat_type_button.dart';
import 'package:hadeet/ui/habit_creation/components/row_reminder_time.dart';
import 'package:hadeet/ui/login/components/default_textfield.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/assets/images.dart';
import 'package:hadeet/uikit/themes/_app_colors.dart';
import 'package:hadeet/uikit/themes/_theme.dart';
import 'package:intl/intl.dart';

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
                        cubit.saveHabit();
                        ///context.push();
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
            BlocBuilder<HabitCreationCubit, HabitCreationState>(
              builder: (context, state) {
                return Column(
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
                                color:
                                    CustomTheme.of(context).colors.neutral3)),
                    const SizedBox(
                      height: 12,
                    ),
                    DefaultTextField(
                      isTextInput: state.isKeyboardActive,
                      onChangeText: (value) {},
                      onTap: cubit.onInputTap,
                      color: Color(state.chosenColor),
                      hintText: 'Enter name your habit',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Bounce(
                      onTap: cubit.onChangeColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Color theme',
                            style: CustomTheme.of(context)
                                .typography
                                .body14Semibold
                                .copyWith(
                                    color: CustomTheme.of(context)
                                        .colors
                                        .neutral3),
                          ),
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(state.chosenColor)),
                          )
                        ],
                      ),
                    ),
                    AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: HabitAvailableColorsList(
                            colors: cubit.colors,
                            chosenColor: state.chosenColor,
                            changeColor: cubit.changeColor,
                          ),
                        ),
                        crossFadeState: state.isChoosingColors
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
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return BlocProvider.value(
                                      value: context.read<HabitCreationCubit>(),
                                      child: HabitCalendarDialog(),
                                    );
                                  });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: CustomTheme.of(context)
                                        .colors
                                        .semantic4,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (state.repeatType == RepeatType.daily ||
                                        state.currentDate != null)
                                      Text('Date',
                                          style: CustomTheme.of(context)
                                              .typography
                                              .body14Medium
                                              .copyWith(
                                                  color: CustomTheme.of(context)
                                                      .colors
                                                      .neutral3)),
                                    Text(
                                      state.repeatType == RepeatType.daily || state.repeatType == RepeatType.weekly
                                          ? 'Today' : state.currentDate != null ? DateFormat('d MMM yyyy').format(state.currentDate!)
                                          : '+ Add date',
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
                              isSelected: state.repeatType == RepeatType.daily,
                              onTap: () {
                                cubit.changeRepeatType(RepeatType.daily);
                              }),
                        ),
                        SizedBox(
                          width: 0.04 * MediaQuery.of(context).size.width,
                        ),
                        Expanded(
                          child: RepeatTypeButton(
                              title: 'Weekly',
                              isSelected: state.repeatType == RepeatType.weekly,
                              onTap: () {
                                cubit.changeRepeatType(RepeatType.weekly);
                              }),
                        ),
                        SizedBox(
                          width: 0.04 * MediaQuery.of(context).size.width,
                        ),
                        Expanded(
                          child: RepeatTypeButton(
                              title: 'Monthly',
                              isSelected:
                                  state.repeatType == RepeatType.monthly,
                              onTap: () {
                                cubit.changeRepeatType(RepeatType.monthly);
                              }),
                        )
                      ],
                    ),
                    AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...cubit.daysOfWeek
                                  .asMap()
                                  .entries
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          cubit.onSelectWeekDay(e.key + 1);
                                        },
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                              color: state.repeatWeekDays
                                                      .contains(e.key + 1)
                                                  ? CustomTheme.of(context)
                                                      .colors
                                                      .primary1
                                                  : CustomTheme.of(context)
                                                      .colors
                                                      .neutral2,
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: Text(e.value,
                                                style: CustomTheme.of(context)
                                                    .typography
                                                    .body14Semibold
                                                    .copyWith(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .colors
                                                            .neutral4)),
                                          ),
                                        ),
                                      ))
                            ],
                          ),
                        ),
                        crossFadeState: state.repeatType == RepeatType.monthly
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300)),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Get reminders',
                              style: CustomTheme.of(context)
                                  .typography
                                  .body14Semibold
                                  .copyWith(
                                      color: CustomTheme.of(context)
                                          .colors
                                          .neutral3),
                            ),
                            HabitReminderSwitcher(
                                value: state.isSettingReminders,
                                inactiveThumbColor:
                                    CustomTheme.of(context).colors.neutral3,
                                inactiveTrackColor:
                                    CustomTheme.of(context).colors.neutral2,
                                activeColorGradient: AppColors.gradient5,
                                activeColorThumb: AppColors.gradient1,
                                onSwitch: cubit.toggleGetRemindersAlt)
                          ],
                        )),
                    AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: Column(children: [
                          ...state.reminders
                              .map((e) => RowReminderTime(
                                  time: e,
                                  onTap: cubit.onReminderTap,
                                  onClose: cubit.onDeleteReminder))
                              .toList()
                        ]),
                        crossFadeState: state.isSettingReminders
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 300)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
