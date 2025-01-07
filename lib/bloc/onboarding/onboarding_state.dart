part of 'onboarding_cubit.dart';

class OnboardingPage{
  OnboardingPage({ required this.title, required this.imagePath});

  final String title;
  final String imagePath;
}

@JsonSerializable()
final class OnboardingState extends Equatable {
  const OnboardingState({this.currentScreen = 0, this.isStart = true});

  final bool isStart;
  final int currentScreen;
  
  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  Map<String, dynamic> toJson() => _$OnboardingStateToJson(this);

  @override
  List<Object?> get props => [currentScreen, isStart];

  OnboardingState copyWith({
    bool? isStart,
    int? currentScreen,
  }) {
    return OnboardingState(
      isStart: isStart ?? this.isStart,
      currentScreen: currentScreen ?? this.currentScreen,
    );
  }
}
