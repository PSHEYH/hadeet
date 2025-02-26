part of 'settings_cubit.dart';

@JsonSerializable()
final class SettingsState extends Equatable {
  const SettingsState({this.currentIndex = 0});

  final int currentIndex;

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsStateToJson(this);

  @override
  List<Object?> get props => [currentIndex];

  SettingsState copyWith({int? currentIndex}) {
    return SettingsState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
