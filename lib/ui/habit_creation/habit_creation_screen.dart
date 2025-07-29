import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/bloc/habit_creation/habit_creation_cubit.dart';
import 'package:hadeet/ui/habit_creation/habit_creation_view.dart';

class HabitCreationScreen extends StatelessWidget {
  const HabitCreationScreen({super.key});

  const HabitCreationScreen._();

  static String routeName = '/habit_creation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF12151B),
      body: BlocProvider(
        create: (context) => HabitCreationCubit(),
        child: const HabitCreationView(),
      ),
    );
  }
}
