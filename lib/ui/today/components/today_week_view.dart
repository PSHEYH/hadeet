import 'dart:ui';

import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/bloc/today/today_cubit.dart';
import 'package:hadeet/models/today/task_status_view.dart';
import 'package:hadeet/ui/today/components/calendar_default_text.dart';
import 'package:hadeet/ui/today/components/habit_card.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_app_colors.dart';
import 'package:hadeet/uikit/themes/_theme.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TodayWeekView extends StatelessWidget {
  const TodayWeekView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TodayCubit, TodayState>(
          builder: (context, state) {
            final cubit = context.read<TodayCubit>();
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  daysOfWeekHeight: 32,
                  rowHeight: 40,
                  startingDayOfWeek: window.locale.toString().contains('US')
                      ? StartingDayOfWeek.sunday
                      : StartingDayOfWeek.monday,
                  onDaySelected: (DateTime lastDateTime, DateTime currentDate) {
                    //// TODO on day selected
                  },
                  selectedDayPredicate: (DateTime dateTime) {
                    return isSameDay(dateTime, state.currentDate);
                  },
                  headerVisible: false,
                  // locale: Get.locale?.languageCode,
                  calendarFormat: CalendarFormat.week,
                  focusedDay: DateTime.now(),
                  firstDay: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day - 365),
                  lastDay: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day + 365),
                  calendarBuilders:
                      CalendarBuilders(markerBuilder: (context, time, list) {
                    if (list.length > 3) {
                      return Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppColors.gradient1),
                          child: Text(
                            list.length.toString(),
                            style: TextStyle(
                              color: CustomTheme.of(context).colors.neutral4,
                            ),
                          ),
                        ),
                      );
                    }
                    return null;
                  }, todayBuilder: (context, time, list) {
                    return GestureDetector(
                      onTap: () {
                        cubit.onChangedDay(time);
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width / 11,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: CustomTheme.of(context).colors.background1,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              time.day.toString(),
                            ),
                          )),
                    );
                  }, selectedBuilder: (context, time, list) {
                    return GestureDetector(
                      onTap: () {
                        cubit.onChangedDay(time);
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width / 11,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomTheme.of(context).colors.primary1,
                          ),
                          child: Center(
                            child: Text(
                              time.day.toString(),
                              style: CustomTheme.of(context)
                                  .typography
                                  .body14Medium
                                  .copyWith(
                                      color: CustomTheme.of(context)
                                          .colors
                                          .neutral4),
                            ),
                          )),
                    );
                  }, dowBuilder: (context, date) {
                    return Text(
                      textAlign: TextAlign.center,
                      cubit.upperCaseFirstLetter(
                          DateFormat('E', "en_US").format(date)),
                      style: CustomTheme.of(context)
                          .typography
                          .body14Semibold
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral3),
                    );
                  }, defaultBuilder: (context, date, list) {
                    return CalendarDefaultText(date: date);
                  }, holidayBuilder: (context, date, list) {
                    return CalendarDefaultText(date: date);
                  }, outsideBuilder: (context, date, list) {
                    return CalendarDefaultText(date: date);
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Bounce(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            color: cubit.state.statusView ==
                                    TasksStatusView.inProgress
                                ? CustomTheme.of(context).colors.primary1
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          'In progress',
                          style: CustomTheme.of(context)
                              .typography
                              .body14Semibold
                              .copyWith(
                                  color:
                                      CustomTheme.of(context).colors.neutral4),
                        ),
                      ),
                    ),
                    Bounce(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            color: cubit.state.statusView ==
                                    TasksStatusView.completed
                                ? CustomTheme.of(context).colors.primary1
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          'Completed',
                          style: CustomTheme.of(context)
                              .typography
                              .body14Semibold
                              .copyWith(
                                  color:
                                      CustomTheme.of(context).colors.neutral4),
                        ),
                      ),
                    ),
                    Bounce(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            color: cubit.state.statusView ==
                                    TasksStatusView.overdue
                                ? CustomTheme.of(context).colors.primary1
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          'Overdue',
                          style: CustomTheme.of(context)
                              .typography
                              .body14Semibold
                              .copyWith(
                                  color:
                                      CustomTheme.of(context).colors.neutral4),
                        ),
                      ),
                    ),
                    Spacer(),
                    Bounce(
                        child: SvgPicture.asset(
                      AppIcons.squareView,
                      width: 24,
                      height: 24,
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 12),
                  child: Text(
                    'Do anytime',
                    style: CustomTheme.of(context)
                        .typography
                        .body14Medium
                        .copyWith(
                            color: CustomTheme.of(context).colors.neutral3),
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...cubit.habits
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: HabitCard(
                                      isSquare: true,
                                      title: e.title,
                                      color: Color(e.color),
                                      category: e.category,
                                      completedCount: e.currentCount,
                                      requiredCount: e.count),
                                ))
                            .toList()
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 12),
                  child: Text(
                    'Morning',
                    style: CustomTheme.of(context)
                        .typography
                        .body14Medium
                        .copyWith(
                            color: CustomTheme.of(context).colors.neutral3),
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...cubit.habits
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: HabitCard(
                                      isSquare: true,
                                      title: e.title,
                                      color: Color(e.color),
                                      category: e.category,
                                      completedCount: e.currentCount,
                                      requiredCount: e.count),
                                ))
                            .toList()
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 12),
                  child: Text(
                    'Afternoon',
                    style: CustomTheme.of(context)
                        .typography
                        .body14Medium
                        .copyWith(
                            color: CustomTheme.of(context).colors.neutral3),
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...cubit.habits
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: HabitCard(
                                      isSquare: true,
                                      title: e.title,
                                      color: Color(e.color),
                                      category: e.category,
                                      completedCount: e.currentCount,
                                      requiredCount: e.count),
                                ))
                            .toList()
                      ],
                    ))
              ],
            );
          },
        ),
      ],
    );
  }
}
