// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayState _$TodayStateFromJson(Map<String, dynamic> json) => TodayState(
      currentDate: DateTime.parse(json['currentDate'] as String),
      type: $enumDecodeNullable(_$TaskScreenTypeEnumMap, json['type']) ??
          TaskScreenType.main,
      statusView:
          $enumDecodeNullable(_$TasksStatusViewEnumMap, json['statusView']) ??
              TasksStatusView.completed,
    );

Map<String, dynamic> _$TodayStateToJson(TodayState instance) =>
    <String, dynamic>{
      'statusView': _$TasksStatusViewEnumMap[instance.statusView]!,
      'currentDate': instance.currentDate.toIso8601String(),
      'type': _$TaskScreenTypeEnumMap[instance.type]!,
    };

const _$TaskScreenTypeEnumMap = {
  TaskScreenType.main: 'main',
  TaskScreenType.week: 'week',
};

const _$TasksStatusViewEnumMap = {
  TasksStatusView.inProgress: 'inProgress',
  TasksStatusView.completed: 'completed',
  TasksStatusView.overdue: 'overdue',
};
