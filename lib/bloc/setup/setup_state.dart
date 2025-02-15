part of 'setup_cubit.dart';

@JsonSerializable()
final class SetupState extends Equatable {
  const SetupState({
    required this.wakeUpDateTime,
    required this.sleepDateTime,
    this.currentScreen = 0,
  });

  final int currentScreen;
  final DateTime wakeUpDateTime;
  final DateTime sleepDateTime;

  factory SetupState.fromJson(Map<String, dynamic> json) =>
      _$SetupStateFromJson(json);

  Map<String, dynamic> toJson() => _$SetupStateToJson(this);

  @override
  List<Object?> get props => [currentScreen, wakeUpDateTime, sleepDateTime];

  SetupState copyWith({
    int? currentScreen,
    DateTime? wakeUpDateTime,
    DateTime? sleepDateTime,
  }) {
    return SetupState(
        currentScreen: currentScreen ?? this.currentScreen,
        wakeUpDateTime: wakeUpDateTime ?? this.wakeUpDateTime,
        sleepDateTime: sleepDateTime ?? this.sleepDateTime);
  }
}
