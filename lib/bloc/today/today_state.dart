part of 'today_cubit.dart';

@JsonSerializable()
final class TodayState extends Equatable {
  const TodayState(
      {required this.currentDate,
      this.type = TaskScreenType.main,
      this.statusView = TasksStatusView.completed});

  final TasksStatusView statusView;
  final DateTime currentDate;
  final TaskScreenType type;

  factory TodayState.fromJson(Map<String, dynamic> json) =>
      _$TodayStateFromJson(json);

  Map<String, dynamic> toJson() => _$TodayStateToJson(this);

  @override
  List<Object?> get props => [currentDate, statusView, type];

  TodayState copyWith(
      {TasksStatusView? taskStatus,
      DateTime? currentDate,
      TaskScreenType? type}) {
    return TodayState(
        statusView: taskStatus ?? statusView,
        currentDate: currentDate ?? this.currentDate,
        type: type ?? this.type);
  }
}
