part of 'habit_creation_cubit.dart';

@JsonSerializable()
final class HabitCreationState extends Equatable {
  const HabitCreationState(
      {
      required this.chosenColor,
      required this.repeatType,
      required this.amount,
      required this.reminders,
        this.currentDate,
        this.isSettingReminders = false,
      this.repeatWeekDays = const [],
      this.repeatDay = 0,
      this.isChoosingCategories = true,
      this.isKeyboardActive = false,
      this.isChoosingColors = false});

  final DateTime? currentDate;
  final bool isChoosingCategories;
  final int chosenColor;
  final RepeatType repeatType;
  final List<int> repeatWeekDays;
  final int repeatDay;
  final int amount;
  final List<DateTime> reminders;
  final bool isKeyboardActive;
  final bool isChoosingColors;
  final bool isSettingReminders;

  factory HabitCreationState.fromJson(Map<String, dynamic> json) =>
      _$HabitCreationStateFromJson(json);

  Map<String, dynamic> toJson() => _$HabitCreationStateToJson(this);

  @override
  List<Object?> get props => [
        currentDate,
        isChoosingCategories,
        chosenColor,
        repeatDay,
        repeatWeekDays,
        amount,
        reminders,
        isChoosingColors,
        isKeyboardActive,
    repeatType,
    isSettingReminders
      ];

  HabitCreationState copyWith({
    DateTime? currentDate,
    bool? isChoosingCategories,
    int? chosenColor,
    RepeatType? repeatType,
    int? repeatDay,
    List<int>? repeatWeekDays,
    int? amount,
    List<DateTime>? reminders,
    bool? isKeyboardActive,
    bool? isChoosingColors,
    bool? isSettingReminders,
  }) {
    return HabitCreationState(
        currentDate: currentDate ?? this.currentDate,
        isChoosingCategories: isChoosingCategories ?? this.isChoosingCategories,
        chosenColor: chosenColor ?? this.chosenColor,
        repeatType: repeatType ?? this.repeatType,
        repeatDay: repeatDay ?? this.repeatDay,
        repeatWeekDays: repeatWeekDays ?? this.repeatWeekDays,
        amount: amount ?? this.amount,
        reminders: reminders ?? this.reminders,
        isKeyboardActive: isKeyboardActive ?? this.isKeyboardActive,
        isChoosingColors: isChoosingColors ?? this.isChoosingColors,
        isSettingReminders: isSettingReminders ?? this.isSettingReminders
    );
  }
}
