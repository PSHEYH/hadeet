import 'package:equatable/equatable.dart';
import 'package:hadeet/models/today/repeat_type.dart';
import 'package:hadeet/models/today/task_status_view.dart';
import 'package:json_annotation/json_annotation.dart';

part 'habit_entity.g.dart';

@JsonSerializable()
class HabitEntity extends Equatable {
  const HabitEntity(
      {required this.title,
      required this.color,
      required this.count,
      required this.currentCount,
      required this.repeatDays,
      required this.category,
      required this.repeatType,
      required this.endDate,
      required this.status});

  final String title;
  final int color;
  final int count;
  final int currentCount;
  final List<int> repeatDays;
  final TasksStatusView status;
  final String category;
  final RepeatType repeatType;
  final DateTime endDate;

  factory HabitEntity.fromJson(Map<String, dynamic> json) =>
      _$HabitEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HabitEntityToJson(this);

  @override
  List<Object?> get props => [
        title,
        color,
        count,
        currentCount,
        repeatDays,
        repeatType,
        endDate,
        category,
        status
      ];
}
