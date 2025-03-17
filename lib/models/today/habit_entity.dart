import 'package:equatable/equatable.dart';
import 'package:hadeet/models/today/repeat_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'habit_entity.g.dart';

@JsonSerializable()
class HabitEntity extends Equatable {
  const HabitEntity({
    required this.title,
    required this.color,
    required this.count,
    required this.repeatDays,
    required this.repeatType,
    required this.endDate,
  });

  final String title;
  final int color;
  final int count;
  final List<int> repeatDays;
  final RepeatType repeatType;
  final DateTime endDate;

  factory HabitEntity.fromJson(Map<String, dynamic> json) =>
      _$HabitEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HabitEntityToJson(this);

  @override
  List<Object?> get props =>
      [title, color, count, repeatDays, repeatType, endDate];
}
