import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/ui/habit/habit_view.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.of(context).colors.background1,
      appBar: AppBar(
        surfaceTintColor: CustomTheme.of(context).colors.neutral1,
        leading: Bounce(
          child: SvgPicture.asset(
            AppIcons.arrowLeftSquare,
            width: 28,
            height: 28,
          ),
          onTap: () {},
        ),
        actions: [
          Bounce(
            child: SvgPicture.asset(
              AppIcons.pause,
              width: 24,
              height: 24,
            ),
            onTap: () {},
          ),
          Bounce(
            child: SvgPicture.asset(
              AppIcons.edit,
              width: 24,
              height: 24,
            ),
            onTap: () {},
          ),
          Bounce(
            child: SvgPicture.asset(
              AppIcons.delete,
              width: 24,
              height: 24,
            ),
            onTap: () {},
          ),
        ],
      ),
      body: HabitView(),
    );
  }
}
