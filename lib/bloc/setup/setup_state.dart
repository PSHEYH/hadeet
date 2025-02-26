part of 'setup_cubit.dart';

@JsonSerializable()
final class SetupState extends Equatable {
  const SetupState(
      {required this.wakeUpDateTime,
      required this.sleepDateTime,
      required this.loadingProgress,
      this.currentScreen = 0,
      this.chosenHabitImage = '',
      this.chosenHabitTitle = '',
      this.chosenHabitGoal = '',
      this.isTextFieldActive = false});

  final int currentScreen;
  final double loadingProgress;
  final DateTime wakeUpDateTime;
  final DateTime sleepDateTime;
  final String chosenHabitTitle;
  final String chosenHabitImage;
  final String chosenHabitGoal;
  final bool isTextFieldActive;

  factory SetupState.fromJson(Map<String, dynamic> json) =>
      _$SetupStateFromJson(json);

  Map<String, dynamic> toJson() => _$SetupStateToJson(this);

  @override
  List<Object?> get props => [
        currentScreen,
        wakeUpDateTime,
        loadingProgress,
        sleepDateTime,
        chosenHabitTitle,
        chosenHabitImage,
        chosenHabitGoal,
        isTextFieldActive
      ];

  SetupState copyWith(
      {int? currentScreen,
      DateTime? wakeUpDateTime,
      DateTime? sleepDateTime,
      double? loadingProgress,
      String? chosenHabitGoal,
      String? chosenHabitTitle,
      String? chosenHabitImage,
      bool? isTextFieldActive}) {
    return SetupState(
        currentScreen: currentScreen ?? this.currentScreen,
        wakeUpDateTime: wakeUpDateTime ?? this.wakeUpDateTime,
        sleepDateTime: sleepDateTime ?? this.sleepDateTime,
        chosenHabitGoal: chosenHabitGoal ?? this.chosenHabitGoal,
        chosenHabitImage: chosenHabitImage ?? this.chosenHabitImage,
        chosenHabitTitle: chosenHabitTitle ?? this.chosenHabitTitle,
        isTextFieldActive: isTextFieldActive ?? this.isTextFieldActive,
        loadingProgress: loadingProgress ?? this.loadingProgress);
  }
}
