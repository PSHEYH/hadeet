import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class Habit {
  const Habit(
      {required this.title, required this.imagePath, required this.goalName});
  final String title;
  final String imagePath;
  final String goalName;
}

class ChooseHabitBody extends StatelessWidget {
  const ChooseHabitBody(
      {super.key, required this.onContinue, required this.onChooseHabit});

  final List<Habit> habits = const [
    Habit(title: 'Bicycle', imagePath: 'bicycle.png', goalName: 'minutes'),
    Habit(title: 'Reading book', imagePath: 'reading.png', goalName: 'pages'),
    Habit(
        title: 'Social activity',
        imagePath: 'greetings_image_5.png',
        goalName: 'minutes'),
    Habit(title: 'Other', imagePath: 'rocket.png', goalName: 'minutes'),
    Habit(title: 'Walking', imagePath: 'walking.png', goalName: 'miles'),
    Habit(title: 'Write diary', imagePath: 'writing.png', goalName: 'pages'),
  ];

  final Function() onContinue;
  final Function(Habit habit) onChooseHabit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Bounce(
                child: SvgPicture.asset(
                  AppIcons.arrowLeftSquare,
                  width: 28,
                  height: 28,
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              Text('Choose first habit\nyou want to build',
                  style: CustomTheme.of(context)
                      .typography
                      .title30Bold
                      .copyWith(
                          color: CustomTheme.of(context).colors.neutral4)),
              const SizedBox(
                height: 40,
              ),
              Wrap(
                runSpacing: 16,
                spacing: 20,
                children: [
                  ...habits.map((e) => Bounce(
                      onTap: () {
                        onContinue();
                        onChooseHabit(e);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: CustomTheme.of(context).colors.neutral1,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/${e.imagePath}',
                              width: 156,
                              height: 156,
                            ),
                            Text(
                              e.title,
                              style: CustomTheme.of(context)
                                  .typography
                                  .headline16Bold
                                  .copyWith(
                                      color: CustomTheme.of(context)
                                          .colors
                                          .neutral4),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
