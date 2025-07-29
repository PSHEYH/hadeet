import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/bloc/habit_creation/habit_creation_cubit.dart';
import 'package:hadeet/uikit/themes/_theme.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitCalendarDialog extends StatelessWidget {
  const HabitCalendarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: CustomTheme.of(context).colors.neutral1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BlocBuilder<HabitCreationCubit, HabitCreationState>(
              builder: (context, state) {
                final cubit = context.read<HabitCreationCubit>();
                return TableCalendar(
                  focusedDay: state.currentDate,
                  firstDay: DateTime((DateTime.now().year - 1),
                      DateTime.now().month, DateTime.now().day),
                  lastDay: DateTime((DateTime.now().year + 3),
                      DateTime.now().month, DateTime.now().day),
                  daysOfWeekHeight: 32,
                  rowHeight: 32,
                  selectedDayPredicate: (date) {
                    return isSameDay(state.currentDate, date);
                  },
                  onDaySelected: (dateFirst, dateSecond) {
                    cubit.selectDay(dateFirst);
                  },
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarFormat: CalendarFormat.month,
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Color(0xFF2D2D2C),
                      ),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: Color(0xFF2D2D2C))),
                  calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                      defaultTextStyle: CustomTheme.of(context)
                          .typography
                          .body14Medium
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral4),
                      weekendTextStyle: CustomTheme.of(context)
                          .typography
                          .body14Medium
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral4),
                      holidayTextStyle: CustomTheme.of(context)
                          .typography
                          .body14Medium
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral4),
                      todayTextStyle: CustomTheme.of(context)
                          .typography
                          .body14Medium
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral4),
                      selectedTextStyle: CustomTheme.of(context)
                          .typography
                          .body14Medium
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral4),
                      selectedDecoration: BoxDecoration(
                          color: CustomTheme.of(context).colors.primary1,
                          shape: BoxShape.circle),
                      cellMargin: const EdgeInsets.all(7),
                      todayDecoration: BoxDecoration(color: CustomTheme.of(context).colors.neutral3, shape: BoxShape.circle)),
                  calendarBuilders:
                      CalendarBuilders(dowBuilder: (context, date) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: Text(
                          cubit.upperCaseFirstLetter(
                              DateFormat('E', 'en_US').format(date)),
                          style: CustomTheme.of(context)
                              .typography
                              .caption12Bold
                              .copyWith(
                                  color:
                                      CustomTheme.of(context).colors.neutral3)),
                    );
                  }, headerTitleBuilder: (context, date) {
                    return Center(
                      child: Text(
                        cubit.upperCaseFirstLetter(
                            DateFormat('MMMM y', 'en_US').format(date)),
                        style: CustomTheme.of(context)
                            .typography
                            .headline16Semibold
                            .copyWith(
                                color:
                                    CustomTheme.of(context).colors.semantic4),
                      ),
                    );
                  }, defaultBuilder: (context, firstDateTime, secondDateTime) {
                    return Center(
                      child: Text(
                        firstDateTime.day.toString(),
                        style: CustomTheme.of(context)
                            .typography
                            .body14Medium
                            .copyWith(
                                color: CustomTheme.of(context).colors.neutral4),
                      ),
                    );
                  }),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Cancel',
                  style: CustomTheme.of(context)
                      .typography
                      .headline16Bold
                      .copyWith(color: CustomTheme.of(context).colors.primary1),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'OK',
                  style: CustomTheme.of(context)
                      .typography
                      .headline16Bold
                      .copyWith(color: CustomTheme.of(context).colors.primary1),
                )),
          ],
        ),
      ),
    );
  }
}
