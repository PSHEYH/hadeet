import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/assets/images.dart';
import 'package:hadeet/uikit/themes/_app_colors.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class BuildingPlanBody extends StatelessWidget {
  BuildingPlanBody(
      {super.key,
      required this.padding,
      required this.goToday,
      required this.hasBuilt});

  final double padding;
  final Function(BuildContext) goToday;
  final bool hasBuilt;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (hasBuilt == false) {
        goToday(context);
      }
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Bounce(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppIcons.arrowLeftSquare,
                    width: 28,
                    height: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Building your\nhabit plan...',
              style: CustomTheme.of(context)
                  .typography
                  .title30Bold
                  .copyWith(color: CustomTheme.of(context).colors.neutral4),
            ),
            SizedBox(
              height: (134 / 812) * MediaQuery.of(context).size.height,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    AppImages.habit,
                    width: 96,
                    height: 96,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Container(
                    width: 166,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: CustomTheme.of(context).colors.neutral2),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 4,
                      margin: EdgeInsets.only(right: padding),
                      decoration: BoxDecoration(
                          gradient: AppColors.gradient5,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
