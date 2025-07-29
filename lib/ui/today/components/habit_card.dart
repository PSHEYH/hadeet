import 'package:flutter/material.dart';
import 'package:hadeet/models/today/task_status_view.dart';
import 'package:hadeet/uikit/assets/images.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class HabitCard extends StatelessWidget {
  const HabitCard(
      {super.key,
      required this.isSquare,
      required this.title,
      required this.color,
      required this.category,
      required this.completedCount,
      required this.requiredCount,
      required this.status,
      this.countStreak = 0});

  final bool isSquare;
  final Color color;
  final String title;
  final String category;
  final int completedCount;
  final int requiredCount;
  final TasksStatusView status;
  final int? countStreak;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: isSquare
          ? MediaQuery.of(context).size.width * 0.416
          : double.infinity,
      height: isSquare
          ? MediaQuery.of(context).size.height * 0.236
          : MediaQuery.of(context).size.height * 0.138,
      decoration: BoxDecoration(
          color: CustomTheme.of(context).colors.neutral1,
          borderRadius: BorderRadius.circular(20)),
      child: isSquare
          ? Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox.square(
                          dimension: 48,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              Image.asset(AppImages.pencils),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(title,
                            style: CustomTheme.of(context)
                                .typography
                                .headline16Bold
                                .copyWith(
                                    color: CustomTheme.of(context)
                                        .colors
                                        .neutral4)),
                        Text(category,
                            style: CustomTheme.of(context)
                                .typography
                                .body14Semibold
                                .copyWith(
                                    color: CustomTheme.of(context)
                                        .colors
                                        .neutral3)),
                      ],
                    ),
                    Container(
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: CustomTheme.of(context).colors.neutral2,
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        margin: EdgeInsets.only(
                            right: ((requiredCount - completedCount) /
                                    requiredCount) *
                                100),
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.037,
                  right: 0,
                  child: Text(
                    '$completedCount/$requiredCount',
                    style: CustomTheme.of(context)
                        .typography
                        .caption12Bold
                        .copyWith(
                            color: CustomTheme.of(context).colors.neutral4),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox.square(
                      dimension: 48,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Image.asset(AppImages.pencils),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Drink water',
                            style: CustomTheme.of(context)
                                .typography
                                .headline16Bold
                                .copyWith(
                                    color: CustomTheme.of(context)
                                        .colors
                                        .neutral4)),
                        Text('Detox',
                            style: CustomTheme.of(context)
                                .typography
                                .body14Semibold
                                .copyWith(
                                    color: CustomTheme.of(context)
                                        .colors
                                        .neutral3)),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            child: Text(
                              '$completedCount/$requiredCount',
                              style: CustomTheme.of(context)
                                  .typography
                                  .caption12Bold
                                  .copyWith(
                                      color: CustomTheme.of(context)
                                          .colors
                                          .neutral4),
                            ),
                            decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(100))),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('glasses',
                            style: CustomTheme.of(context)
                                .typography
                                .caption12Medium
                                .copyWith(
                                    color: CustomTheme.of(context)
                                        .colors
                                        .neutral3))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 4,
                  width: (MediaQuery.of(context).size.width - 48),
                  decoration: BoxDecoration(
                      color: CustomTheme.of(context).colors.neutral2,
                      borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            ((requiredCount - completedCount) / requiredCount) *
                                (MediaQuery.of(context).size.width - 48)),
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(100)),
                  ),
                )
              ],
            ),
    );
  }
}
