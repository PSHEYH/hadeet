import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hadeet/bloc/today/today_cubit.dart';
import 'package:hadeet/ui/habit_creation/habit_creation_screen.dart';
import 'package:hadeet/ui/today/today_view.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  static String routeName = '/today';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12151B),
      body: BlocProvider(
        create: (context) => TodayCubit(),
        child: const TodayView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pushNamed(HabitCreationScreen.routeName);
        },
        backgroundColor: CustomTheme.of(context).colors.primary1,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: CustomTheme.of(context).colors.neutral4,
          size: 20,
        ),
      ),
    );
  }
}
