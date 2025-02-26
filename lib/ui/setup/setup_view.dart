import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/bloc/setup/setup_cubit.dart';
import 'package:hadeet/ui/setup/components/building_plan_body.dart';
import 'package:hadeet/ui/setup/components/choose_habit_body.dart';
import 'package:hadeet/ui/setup/components/do_you_procrastinate_body.dart';
import 'package:hadeet/ui/setup/components/habit_body.dart';
import 'package:hadeet/ui/setup/components/what_time_sleep_body.dart';
import 'package:hadeet/ui/setup/components/what_time_wakeup_body.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupState>(builder: (buildContext, state) {
      final SetupCubit controller = buildContext.read<SetupCubit>();
      controller.addFocusNodeListener();
      List<Widget> pages = [
        WhatTimeWakeupBody(
          onChangeTime: controller.onChangeTime,
          wakeUpTime: state.wakeUpDateTime,
          onContinue: controller.onContinue,
        ),
        WhatTimeSleepBody(
          onChangeTime: controller.onChangeTime,
          sleepTime: state.sleepDateTime,
          onContinue: controller.onContinue,
        ),
        DoYouProcrastinateBody(
            title: 'Do you\nprocrastinate\non your work?',
            firstChoice: 'Yes, I’m ready to\nchange that',
            secondChoice: 'No, I easily finish\nthe tasks at hand',
            thirdChoice: 'Not ready\nto answer',
            onContinue: controller.onContinue),
        DoYouProcrastinateBody(
            title: 'Do you find it hard\nto focus?',
            firstChoice: 'Yes, I’m get\ndistracted easily',
            secondChoice: 'No, I stay focused\nwhen needed',
            thirdChoice: 'Not ready\nto answer',
            onContinue: controller.onContinue),
        DoYouProcrastinateBody(
            title: 'What do you hope to\nachieve with\nHaDeet?',
            firstChoice: 'I want to build\ngood habits',
            secondChoice: 'I want to be\n organized',
            thirdChoice: 'Not ready\nto answer',
            onContinue: controller.onContinue),
        ChooseHabitBody(
          onContinue: controller.onContinue,
          onChooseHabit: controller.onChooseHabit,
        ),
        HabitBody(
          imagePath: controller.state.chosenHabitImage,
          title: controller.state.chosenHabitTitle,
          goalName: controller.state.chosenHabitGoal,
          node: controller.focusNode,
          onTextFieldTap: controller.onTextFieldTap,
          isTextFieldActive: controller.state.isTextFieldActive,
          onContinue: controller.onContinue,
        ),
        BuildingPlanBody(
          padding: controller.state.loadingProgress,
          goToday: controller.goToToday,
          hasBuilt: controller.hasBuilt,
        ),
      ];

      return PageView.builder(
          itemCount: pages.length,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          controller: controller.pageController,
          itemBuilder: (cnt, index) {
            return pages[index];
          });
    });
  }
}
