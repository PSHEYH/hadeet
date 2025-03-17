import 'package:get_storage/get_storage.dart';
import 'package:hadeet/models/today/habit_entity.dart';

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
        [];
  }
}
