import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_cubit.g.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends HydratedCubit<OnboardingState>{
  OnboardingCubit(): super(OnboardingState());

  List<OnboardingPage> pages = [
    OnboardingPage(title: 'Develop good habits', imagePath: 'assets/images/greetings_image_2.png'),
    OnboardingPage(title: 'Track your progress', imagePath: 'assets/images/greetings_image_3.png'),
    OnboardingPage(title: 'Break bad habits', imagePath: 'assets/images/greetings_image_4.png'),
    OnboardingPage(title: 'Challenge your friends', imagePath: 'assets/images/greetings_image_5.png')
  ];

  void skipStartScreen(){
    emit(state.copyWith(isStart: false,));
  }

  void nextScreen(){
    emit(state.copyWith(currentScreen: state.currentScreen < pages.length ? state.currentScreen+1 : state.currentScreen));
  }

  void previousScreen(){
    emit(state.copyWith(currentScreen: state.currentScreen > 1 ? state.currentScreen - 1 : state.currentScreen));
  }

  void loginWithEmail(){

  }

  void loginWithGoogle(){
    
  }

   @override
  OnboardingState fromJson(Map<String, dynamic> json) =>
      OnboardingState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(OnboardingState state) {
    return state.toJson();

}