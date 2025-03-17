import 'package:flutter/material.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class CalendarDefaultText extends StatelessWidget {
  const CalendarDefaultText({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 37.5,
        child: Center(
          child: Text(
            date.day.toString(),
            style: CustomTheme.of(context)
                .typography
                .body14Medium
                .copyWith(color: CustomTheme.of(context).colors.neutral3),
          ),
        ));
  }
}
