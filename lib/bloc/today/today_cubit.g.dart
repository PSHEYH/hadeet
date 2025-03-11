// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayState _$TodayStateFromJson(Map<String, dynamic> json) => TodayState(
      statusView:
          $enumDecodeNullable(_$TasksStatusViewEnumMap, json['statusView']) ??
              TasksStatusView.completed,
    );

Map<String, dynamic> _$TodayStateToJson(TodayState instance) =>
    <String, dynamic>{
      'statusView': _$TasksStatusViewEnumMap[instance.statusView]!,
    };

const _$TasksStatusViewEnumMap = {
  TasksStatusView.inProgress: 'inProgress',
  TasksStatusView.completed: 'completed',
  TasksStatusView.overdue: 'overdue',
};
