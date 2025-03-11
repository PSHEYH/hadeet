

import 'package:get_storage/get_storage.dart';

class HabitRepository {
  static final HabitRepository instance = HabitRepository._internal();

  HabitRepository._internal();

  final _box = GetStorage();

  void saveHabit(){
    
  }
}
