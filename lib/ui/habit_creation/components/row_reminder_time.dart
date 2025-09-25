
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_theme.dart';
import 'package:intl/intl.dart';

class RowReminderTime extends StatelessWidget {
  const RowReminderTime({super.key, required this.time, required this.onTap, required this.onClose});

  final DateTime time;
  final Function() onTap;
  final Function(DateTime) onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 12), child: Row(
      children: [
        SvgPicture.asset(AppIcons.clock, width: 20, height: 20,),
        const SizedBox(width: 10,),
        Text(DateFormat('HH:mm').format(time), style: CustomTheme.of(context).typography.body14Semibold.copyWith(color: CustomTheme.of(context).colors.neutral4),),
        const Spacer(),
        GestureDetector(onTap: (){
          onClose(time);
        } ,child: SvgPicture.asset(AppIcons.closeSquare),)
      ],
    ));
  }
}
