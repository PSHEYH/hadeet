import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/bloc/today/today_cubit.dart';
import 'package:hadeet/models/today/task_screen_type.dart';
import 'package:hadeet/ui/settings/settings_screen.dart';
import 'package:hadeet/ui/today/components/today_main_view.dart';
import 'package:hadeet/ui/today/components/today_week_view.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/assets/images.dart';

class TodayView extends StatelessWidget {
  const TodayView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<TodayCubit, TodayState>(builder: (context, state) {
      final cubit = context.read<TodayCubit>();
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Bounce(
                    onTap: () {
                      Navigator.of(context).push(SettingsScreen.route());
                    },
                    child: SvgPicture.asset(
                      AppIcons.profile,
                      height: 28,
                      width: 28,
                    )),
                const Spacer(),
                Image.asset(
                  AppImages.avatar,
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: cubit.state.type == TaskScreenType.main
                    ? TodayMainView(
                        name: cubit.user.name,
                      )
                    : TodayWeekView(),
              ),
            ),
          ),
        ],
      );
    }));
  }
}
