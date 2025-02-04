import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/bloc/onboarding/onboarding_cubit.dart';
import 'package:hadeet/ui/onboarding/onboarding_view.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  const OnboardingScreen._();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const OnboardingScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF12151B),
        body: BlocProvider(
          create: (context) => OnboardingCubit(),
          child: const OnboardingView(),
        ));
  }
}
