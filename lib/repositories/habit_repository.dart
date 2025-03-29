import 'package:get_storage/get_storage.dart';
import 'package:hadeet/models/today/habit_entity.dart';
import 'package:hadeet/models/today/repeat_type.dart';
import 'package:hadeet/models/today/task_status_view.dart';

class HabitRepository {
  static final HabitRepository instance = HabitRepository._internal();

  HabitRepository._internal();

  final _box = GetStorage();

  void saveHabit(HabitEntity habit) {}

  List<HabitEntity> getHabits() {
    final res = _box.read('habits');

    return (res as List<dynamic>?)
            ?.map((e) => HabitEntity.fromJson(e))
            .toList() ??
        [
          HabitEntity(
              title: 'Drink Water',
              color: 0xFFFFA2C0,
              count: 5,
              currentCount: 1,
              repeatDays: const [],
              category: 'Detox',
              repeatType: RepeatType.daily,
              endDate: DateTime.now(),
              status: TasksStatusView.inProgress),
          HabitEntity(
              title: 'Read Book',
              color: 0xFFA0D7E7,
              count: 10,
              currentCount: 2,
              repeatDays: const [],
              category: 'Focus',
              repeatType: RepeatType.daily,
              endDate: DateTime.now(),
              status: TasksStatusView.inProgress),
          HabitEntity(
              title: 'Do exercise',
              color: 0xFF86FFCA,
              count: 15,
              currentCount: 5,
              repeatDays: const [],
              category: 'Change your batteries',
              repeatType: RepeatType.daily,
              endDate: DateTime.now(),
              status: TasksStatusView.inProgress),
        ];
  }
}
