part of 'profile_cubit.dart';

@JsonSerializable()
final class ProfileState extends Equatable {
  const ProfileState({
    this.chosenButton = 0
  });

  final int chosenButton;

  factory ProfileState.fromJson(Map<String, dynamic> json) =>
      _$ProfileStateFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileStateToJson(this);

  @override
  List<Object?> get props => [chosenButton];

  ProfileState copyWith({
    int? chosenButton
  }) {
    return ProfileState(
        chosenButton: chosenButton ?? this.chosenButton
    );
  }
}
