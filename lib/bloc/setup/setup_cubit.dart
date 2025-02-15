import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setup_cubit.g.dart';
part 'setup_state.dart';

class SetupCubit extends HydratedCubit<SetupState> {
  SetupCubit()
      : super(SetupState(
            wakeUpDateTime: DateTime.now().copyWith(hour: 7, minute: 30),
            sleepDateTime: DateTime.now().copyWith(hour: 22, minute: 30)));

  PageController pageController = PageController();
  int countScreen = 0;

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

  onContinue() {
    countScreen = countScreen + 1;
    pageController.animateToPage(countScreen,
        duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
  }

  @override
  Future<void> close() {
    emit(state.copyWith(
        wakeUpDateTime: DateTime.now().copyWith(hour: 7, minute: 30)));
    return super.close();
  }

  @override
  SetupState fromJson(Map<String, dynamic> json) => SetupState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SetupState state) {
    return state.toJson();
  }
}
