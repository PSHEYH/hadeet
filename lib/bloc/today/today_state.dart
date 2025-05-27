part of 'today_cubit.dart';

@JsonSerializable()
final class TodayState extends Equatable {
  const TodayState(
      {required this.currentDate,
      this.type = TaskScreenType.main,
      this.statusView = TasksStatusView.completed,
      this.placementType = TasksPlacementType.blocks});

  final TasksStatusView statusView;
  final DateTime currentDate;
  final TaskScreenType type;
  final TasksPlacementType placementType;

  factory TodayState.fromJson(Map<String, dynamic> json) =>
      _$TodayStateFromJson(json);

  Map<String, dynamic> toJson() => _$TodayStateToJson(this);

  @override
  List<Object?> get props => [currentDate, statusView, type, placementType];

  TodayState copyWith(
      {TasksStatusView? taskStatus,
      DateTime? currentDate,
      TaskScreenType? type,
      TasksPlacementType? placementType}) {
    return TodayState(
        statusView: taskStatus ?? statusView,
        currentDate: currentDate ?? this.currentDate,
        type: type ?? this.type,
        placementType: placementType ?? this.placementType);
  }
}
