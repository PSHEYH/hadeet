import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hadeet/models/today/habit_entity.dart';
import 'package:hadeet/models/today/task_placement_type.dart';
import 'package:hadeet/models/today/task_screen_type.dart';
import 'package:hadeet/models/today/task_status_view.dart';
import 'package:hadeet/models/user/user.dart';
import 'package:hadeet/repositories/habit_repository.dart';
import 'package:hadeet/repositories/user_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'today_cubit.g.dart';
part 'today_state.dart';

class TodayCubit extends Cubit<TodayState> {
  TodayCubit() : super(TodayState(currentDate: DateTime.now())) {
    user = _userRepository.getUserData();
    habits = _habitRepository.getHabits();
  }

  final UserRepository _userRepository = UserRepository.instance;
  final HabitRepository _habitRepository = HabitRepository.instance;

  TextEditingController textEditingController = TextEditingController();
  late final User user;
  late final List<HabitEntity> habits;

  List<HabitEntity> get morningHabits {
    return habits.where((e) => e.endDate.hour < 12).toList();
  }

  List<HabitEntity> get afternoonHabits {
    return habits
        .where((e) => e.endDate.hour >= 12 && e.endDate.hour <= 14)
        .toList();
  }

  List<HabitEntity> get eveningHabits {
    return habits.where((e) => e.endDate.hour > 14).toList();
  }

  upperCaseFirstLetter(String value) {
    return '${value.characters.first.toUpperCase()}${value.substring(1)}';
  }

  onChangedDay(DateTime date) {
    emit(state.copyWith(currentDate: date));
  }

  filter(TasksStatusView statusView) {
    emit(state.copyWith(taskStatus: statusView));
  }

  onMainTaskTap() {
    emit(state.copyWith(type: TaskScreenType.week));
  }

  onChangeTasksPlacement() {
    emit(state.copyWith(
        placementType: state.placementType == TasksPlacementType.blocks
            ? TasksPlacementType.cards
            : TasksPlacementType.blocks));
  }
}
