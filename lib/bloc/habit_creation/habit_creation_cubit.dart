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
    0xFFFFCE73,
    0xFFA5F59C,
    0xFF558CE4
  ];

  List<String> daysOfWeek = [
    'M','T','W','T','F','S','S'
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

  void toggleGetReminders(bool value){
    emit(state.copyWith(isSettingReminders: value));
  }

  void toggleGetRemindersAlt(){
    if(state.isSettingReminders){
      emit(state.copyWith(isSettingReminders: false, reminders: []));
    } else {
      emit(state.copyWith(isSettingReminders: true, reminders: [DateTime.now().copyWith(hour: 8, minute: 0)]));
    }
  }

  void onChangeColor(){
    emit(state.copyWith(isChoosingColors: !state.isChoosingColors));
  }

  String upperCaseFirstLetter(String value) {
    return '${value[0].toUpperCase()}${value.substring(1)}';
  }

  void goToCreation() {
    emit(state.copyWith(isChoosingCategories: false));
  }

  void onSelectWeekDay(int weekDayIndex){
    emit(state.copyWith(repeatWeekDays: state.repeatWeekDays.contains(weekDayIndex) ? state.repeatWeekDays.where((e) => e != weekDayIndex).toList() : <int>[...state.repeatWeekDays, weekDayIndex]));
  }

  void onDeleteReminder(DateTime time){
    emit(state.copyWith(reminders: state.reminders.where((e) => e.hour != time.hour || e.minute != time.minute).toList()));
  }
  void onReminderTap(){

  }
}
