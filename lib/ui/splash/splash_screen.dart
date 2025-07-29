import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hadeet/ui/onboarding/onboarding_screen.dart';
import 'package:hadeet/ui/today/today_screen.dart';
import 'package:hadeet/utils/check_user_auth.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  static String routeName = '/splash';

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      bool isAuthenticated = checkUserAuth(); //
      if (context.mounted) {
        if (!isAuthenticated) {
          GoRouter.of(context).pushReplacementNamed(OnboardingScreen.routeName);
        } else {
          GoRouter.of(context).pushReplacementNamed(TodayScreen.routeName);
        } // Your auth check function
      }
    });
    return Scaffold(
      backgroundColor: const Color(0xFF12151B),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/top_rectangle.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/bottom_rectangle.png'),
          ),
          Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/icons/Logo.svg')),
        ],
      ),
    );
  }
}
