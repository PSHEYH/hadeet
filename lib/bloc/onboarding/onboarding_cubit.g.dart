// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) =>
    OnboardingState(
      currentScreen: (json['currentScreen'] as num?)?.toInt() ?? 0,
      isStart: json['isStart'] as bool? ?? true,
    );

Map<String, dynamic> _$OnboardingStateToJson(OnboardingState instance) =>
    <String, dynamic>{
      'isStart': instance.isStart,
      'currentScreen': instance.currentScreen,
    };
