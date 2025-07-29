import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/models/today/repeat_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'habit_creation_cubit.g.dart';
part 'habit_creation_state.dart';

class HabitCreationCubit extends Cubit<HabitCreationState> {
  List<int> colors = [
    0xFF8E96FF,
    0xFF9ADB7F,
    0xFFFFB28E,
    0xFFBBFFE7,
    0xFFCDE7FF,
    0xFFE2BDFF,
    0xFFFFA2C0,
    0xFFCDE7FF,
    0xFFA5F59C
  ];

  TextEditingController textEditingController = TextEditingController();

  HabitCreationCubit()
      : super(HabitCreationState(
            currentDate: DateTime.now(),
            chosenColor: 0xFFFFB28E,
            repeatType: RepeatType.daily,
            amount: 0,
            reminders: const []));

  changeColor(int chosenColor) {
    emit(state.copyWith(chosenColor: chosenColor));
  }

  onInputTap() {
    emit(state.copyWith(isKeyboardActive: true));
  }

  onCancelInput() {
    emit(state.copyWith(isKeyboardActive: false));
  }

  changeRepeatType(RepeatType type) {
    emit(state.copyWith(repeatType: type));
  }

  selectDay(DateTime date) {
    emit(state.copyWith(currentDate: date));
  }

  String upperCaseFirstLetter(String value) {
    return '${value[0].toUpperCase()}${value.substring(1)}';
  }

  void goToCreation() {
    emit(state.copyWith(isChoosingCategories: false));
  }
}
