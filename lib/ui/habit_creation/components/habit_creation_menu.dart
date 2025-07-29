import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/bloc/habit_creation/habit_creation_cubit.dart';
import 'package:hadeet/ui/habit_creation/components/habit_category_container.dart';
import 'package:hadeet/ui/habit_creation/components/habit_choosing_button.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/assets/images.dart';
import 'package:hadeet/uikit/themes/_app_colors.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class HabitCreationMenu extends StatelessWidget {
  const HabitCreationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitCreationCubit>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Bounce(
                    child: SvgPicture.asset(
                      AppIcons.arrowLeftSquare,
                      width: 20,
                      height: 20,
                    ),
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('Create Habit',
                      style: CustomTheme.of(context)
                          .typography
                          .title20Bold
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral4))
                ],
              ),
            ),
            HabitChoosingButton(
                onTap: () {
                  HapticFeedback.lightImpact();
                  cubit.goToCreation();
                },
                title: 'Regular Habit',
                description: 'Focus',
                color: CustomTheme.of(context).colors.semantic3,
                imagePath: AppImages.habit),
            const SizedBox(
              height: 16,
            ),
            HabitChoosingButton(
                onTap: () {
                  HapticFeedback.lightImpact();
                  cubit.goToCreation();
                },
                title: 'One-time task',
                description: 'Focus',
                color: CustomTheme.of(context).colors.semantic1,
                imagePath: AppImages.task),
            const SizedBox(
              height: 20,
            ),
            Text('Or choose from these categories',
                style: CustomTheme.of(context)
                    .typography
                    .body14Semibold
                    .copyWith(color: CustomTheme.of(context).colors.neutral3)),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Flexible(
                  child: HabitCategoryContainer(
                      title: 'Trending habits',
                      description: 'Take a step in the right direction',
                      gradient: AppColors.gradient1),
                ),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: HabitCategoryContainer(
                      title: 'Must have',
                      description: 'Small effort, big result',
                      gradient: AppColors.gradient3),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Flexible(
                  child: HabitCategoryContainer(
                      title: 'Healthy body',
                      description: 'The foundation of your wall-being',
                      gradient: AppColors.gradient4),
                ),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: HabitCategoryContainer(
                      title: 'Stress relief',
                      description: 'Release tension and increase calm',
                      gradient: AppColors.gradient6),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
