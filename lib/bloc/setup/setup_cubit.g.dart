// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupState _$SetupStateFromJson(Map<String, dynamic> json) => SetupState(
      wakeUpDateTime: DateTime.parse(json['wakeUpDateTime'] as String),
      sleepDateTime: DateTime.parse(json['sleepDateTime'] as String),
      loadingProgress: (json['loadingProgress'] as num).toDouble(),
      currentScreen: (json['currentScreen'] as num?)?.toInt() ?? 0,
      chosenHabitImage: json['chosenHabitImage'] as String? ?? '',
      chosenHabitTitle: json['chosenHabitTitle'] as String? ?? '',
      chosenHabitGoal: json['chosenHabitGoal'] as String? ?? '',
      isTextFieldActive: json['isTextFieldActive'] as bool? ?? false,
    );

Map<String, dynamic> _$SetupStateToJson(SetupState instance) =>
    <String, dynamic>{
      'currentScreen': instance.currentScreen,
      'loadingProgress': instance.loadingProgress,
      'wakeUpDateTime': instance.wakeUpDateTime.toIso8601String(),
      'sleepDateTime': instance.sleepDateTime.toIso8601String(),
      'chosenHabitTitle': instance.chosenHabitTitle,
      'chosenHabitImage': instance.chosenHabitImage,
      'chosenHabitGoal': instance.chosenHabitGoal,
      'isTextFieldActive': instance.isTextFieldActive,
    };
