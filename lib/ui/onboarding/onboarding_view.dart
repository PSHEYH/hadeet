import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/bloc/onboarding/onboarding_cubit.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_theme.dart';
import 'package:hadeet/widgets/login_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
      return state.currentScreen == 0
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/greetings_image_1.png',
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Text(
                    'Habit tracker 🙌',
                    style: CustomTheme.of(context)
                        .typography
                        .headline16Bold
                        .copyWith(
                            color: CustomTheme.of(context).colors.primary1),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'The best time to \nstart is now!',
                    style: CustomTheme.of(context)
                        .typography
                        .title30Bold
                        .copyWith(
                            color: CustomTheme.of(context).colors.neutral4),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      'You’re taking the first step in changing your life. \nLet us guide you through it.',
                      style: CustomTheme.of(context)
                          .typography
                          .body14Medium
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral2)),
                  const SizedBox(
                    height: 20,
                  ),
                  Bounce(
                      onTap: () {
                        context.read<OnboardingCubit>().nextScreen();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 35),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomTheme.of(context).colors.primary1),
                        child: Text(
                          'Let’s do it',
                          style: CustomTheme.of(context)
                              .typography
                              .headline16Bold
                              .copyWith(
                                  color:
                                      CustomTheme.of(context).colors.neutral4),
                        ),
                      )),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: PageView.builder(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    controller: context.read<OnboardingCubit>().pageController,
                    itemCount: context.read<OnboardingCubit>().pages.length,
                    onPageChanged:
                        context.read<OnboardingCubit>().changePageIndex,
                    itemBuilder: (context, index) {
                      final page = context.read<OnboardingCubit>().pages[index];
                      return index == 1
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          (87 / 375),
                                  vertical: MediaQuery.of(context).size.height *
                                      (62 / 812)),
                              child: Image.asset(page.imagePath,
                                  width: 202, height: 250),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Image.asset(
                                page.imagePath,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width,
                              ),
                            );
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    SmoothPageIndicator(
                        controller: context
                            .read<OnboardingCubit>()
                            .pageController, // PageController
                        count: context.read<OnboardingCubit>().pages.length,
                        effect: WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: CustomTheme.of(context).colors.neutral3,
                          activeDotColor:
                              CustomTheme.of(context).colors.primary1,
                          spacing: 12,
                          paintStyle: PaintingStyle.fill,
                        ), // your preferred effect
                        onDotClicked: (index) {}),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          context
                              .read<OnboardingCubit>()
                              .pages[state.currentScreen - 1]
                              .title,
                          textAlign: TextAlign.left,
                          style: CustomTheme.of(context)
                              .typography
                              .title30Bold
                              .copyWith(
                                  color:
                                      CustomTheme.of(context).colors.neutral4)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Habits are fundamental part of our life. Make the most of your life!',
                        style: CustomTheme.of(context)
                            .typography
                            .body14Medium
                            .copyWith(
                                color: CustomTheme.of(context).colors.neutral2),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Bounce(
                        onTap: () {
                          context
                              .read<OnboardingCubit>()
                              .loginWithEmail(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: CustomTheme.of(context).colors.primary1),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppIcons.message,
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text('Continue with Email',
                                  style: CustomTheme.of(context)
                                      .typography
                                      .headline16Bold
                                      .copyWith(
                                          color: CustomTheme.of(context)
                                              .colors
                                              .neutral4))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: LoginButton(
                                  onTap: () {}, icon: AppIcons.google)),
                          const SizedBox(
                            width: 23,
                          ),
                          Expanded(
                              child: LoginButton(
                                  onTap: () {}, icon: AppIcons.facebook)),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'By continuing you argree Habeet’s ',
                                  style: CustomTheme.of(context)
                                      .typography
                                      .caption12Medium
                                      .copyWith(
                                          color: CustomTheme.of(context)
                                              .colors
                                              .neutral2)),
                              TextSpan(
                                  text: 'Terms of Services & Privacy Policy',
                                  style: CustomTheme.of(context)
                                      .typography
                                      .caption12Bold
                                      .copyWith(
                                          color: CustomTheme.of(context)
                                              .colors
                                              .semantic1)),
                            ],
                          )),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                )
              ],
            );
    }));
  }
}
