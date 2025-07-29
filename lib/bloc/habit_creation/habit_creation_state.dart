part of 'habit_creation_cubit.dart';

@JsonSerializable()
final class HabitCreationState extends Equatable {
  HabitCreationState(
      {required this.currentDate,
      required this.chosenColor,
      required this.repeatType,
      required this.amount,
      required this.reminders,
      this.repeatWeekDay = 0,
      this.repeatDay = 0,
      this.isChoosingCategories = true,
      this.isKeyboardActive = false,
      this.isChoosingColors = false});

  final DateTime currentDate;
  final bool isChoosingCategories;
  final int chosenColor;
  final RepeatType repeatType;
  final int repeatWeekDay;
  final int repeatDay;
  final int amount;
  final List<DateTime> reminders;
  final bool isKeyboardActive;
  final bool isChoosingColors;

  factory HabitCreationState.fromJson(Map<String, dynamic> json) =>
      _$HabitCreationStateFromJson(json);

  Map<String, dynamic> toJson() => _$HabitCreationStateToJson(this);

  @override
  List<Object?> get props => [
        currentDate,
        isChoosingCategories,
        chosenColor,
        repeatDay,
        repeatWeekDay,
        amount,
        reminders,
        isChoosingColors,
        isKeyboardActive
      ];

  HabitCreationState copyWith({
    DateTime? currentDate,
    bool? isChoosingCategories,
    int? chosenColor,
    RepeatType? repeatType,
    int? repeatDay,
    int? repeatWeekDay,
    int? amount,
    List<DateTime>? reminders,
    bool? isKeyboardActive,
    bool? isChoosingColors,
  }) {
    return HabitCreationState(
        currentDate: currentDate ?? this.currentDate,
        isChoosingCategories: isChoosingCategories ?? this.isChoosingCategories,
        chosenColor: chosenColor ?? this.chosenColor,
        repeatType: repeatType ?? this.repeatType,
        repeatDay: repeatDay ?? this.repeatDay,
        repeatWeekDay: repeatWeekDay ?? this.repeatWeekDay,
        amount: amount ?? this.amount,
        reminders: reminders ?? this.reminders,
        isKeyboardActive: isKeyboardActive ?? this.isKeyboardActive,
        isChoosingColors: isChoosingColors ?? this.isChoosingColors);
  }
}
