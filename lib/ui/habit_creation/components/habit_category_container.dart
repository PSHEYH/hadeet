import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:hadeet/uikit/assets/images.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class HabitCategoryContainer extends StatelessWidget {
  const HabitCategoryContainer(
      {super.key,
      required this.title,
      required this.description,
      required this.gradient});

  final String title;
  final String description;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.221,
        decoration: BoxDecoration(
            color: CustomTheme.of(context).colors.neutral1,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: gradient,
                image:
                    const DecorationImage(image: AssetImage(AppImages.pencils)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(title,
                maxLines: 1,
                style: CustomTheme.of(context)
                    .typography
                    .headline16Bold
                    .copyWith(color: CustomTheme.of(context).colors.neutral4)),
            Text(
              description,
              maxLines: 2,
              style: CustomTheme.of(context)
                  .typography
                  .body14Medium
                  .copyWith(color: CustomTheme.of(context).colors.neutral3),
            ),
          ],
        ),
      ),
    );
  }
}
