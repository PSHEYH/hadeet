import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/bloc/habit_creation/habit_creation_cubit.dart';
import 'package:hadeet/ui/habit_creation/components/habit_creation_body.dart';
import 'package:hadeet/ui/habit_creation/components/habit_creation_menu.dart';

class HabitCreationView extends StatelessWidget {
  const HabitCreationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitCreationCubit, HabitCreationState>(
        builder: (context, state) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          context.read<HabitCreationCubit>().onCancelInput();
          FocusScope.of(context).unfocus();
        },
        child: state.isChoosingCategories
            ? HabitCreationMenu()
            : HabitCreationBody(),
      );
    });
  }
}
