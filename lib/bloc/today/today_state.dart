part of 'today_cubit.dart';

@JsonSerializable()
final class TodayState extends Equatable {
  const TodayState({
      this.statusView = TasksStatusView.completed
  });

  final TasksStatusView statusView;

  factory TodayState.fromJson(Map<String, dynamic> json) =>
      _$TodayStateFromJson(json);

  Map<String, dynamic> toJson() => _$TodayStateToJson(this);

  @override
  List<Object?> get props => [];

  TodayState copyWith({
    TasksStatusView? taskStatus
}) {
    return TodayState(
      statusView: taskStatus ?? this.statusView
    );
  }
}
