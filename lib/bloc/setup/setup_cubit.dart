import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hadeet/ui/setup/components/choose_habit_body.dart';
import 'package:hadeet/ui/today/today_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setup_cubit.g.dart';
part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit()
      : super(SetupState(
            wakeUpDateTime: DateTime.now().copyWith(hour: 7, minute: 30),
            sleepDateTime: DateTime.now().copyWith(hour: 22, minute: 30),
            loadingProgress: 166));

  FocusNode focusNode = FocusNode();
  PageController pageController = PageController();
  int countScreen = 0;
  bool hasBuilt = false;

  addFocusNodeListener() {
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 400), () {
          emit(state.copyWith(isTextFieldActive: false));
        });
      }
    });
  }

  onChangeTime(bool isHour, int count, [String type = 'wakeup']) {
    if (type == 'wakeup') {
      int hours = state.wakeUpDateTime.hour;
      int minutes = state.wakeUpDateTime.minute;

      emit(state.copyWith(
          wakeUpDateTime: isHour
              ? DateTime.now().copyWith(hour: count, minute: minutes)
              : DateTime.now().copyWith(minute: count, hour: hours)));
    } else {
      int hours = state.sleepDateTime.hour;
      int minutes = state.sleepDateTime.minute;
      emit(state.copyWith(
          sleepDateTime: isHour
              ? DateTime.now().copyWith(hour: count, minute: minutes)
              : DateTime.now().copyWith(minute: count, hour: hours)));
    }
  }

  Future onContinue() async {
    countScreen = countScreen + 1;
    await pageController.animateToPage(countScreen,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  goToToday(BuildContext buildContext) async {
    if (countScreen == 7) {
      hasBuilt = true;
      emit(state.copyWith(loadingProgress: state.loadingProgress - 36));
      await Future.delayed(const Duration(milliseconds: 900));
      emit(state.copyWith(loadingProgress: state.loadingProgress - 50));
      await Future.delayed(const Duration(milliseconds: 700));
      emit(state.copyWith(loadingProgress: state.loadingProgress - 40));
      await Future.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(loadingProgress: state.loadingProgress - 40));
      await Future.delayed(const Duration(milliseconds: 200));
    }
    // if (buildContext.mounted) {
    //   Navigator.of(buildContext).pop();
    // }
    if (buildContext.mounted) {
      GoRouter.of(buildContext).pushNamed(TodayScreen.routeName);
    }
  }

  onChooseHabit(Habit habit) {
    emit(state.copyWith(
        chosenHabitTitle: habit.title,
        chosenHabitImage: habit.imagePath,
        chosenHabitGoal: habit.goalName));
  }

  onTextFieldTap() {
    emit(state.copyWith(isTextFieldActive: true));
  }
}
