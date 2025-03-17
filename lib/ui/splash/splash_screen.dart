import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/ui/onboarding/onboarding_screen.dart';
import 'package:hadeet/ui/today/today_screen.dart';
import 'package:hadeet/utils/check_user_auth.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  Timer? _timer;

  SplashScreen._();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: '/splash'),
      builder: (_) => SplashScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _timer?.cancel();
      timer.cancel();
      bool isAuthenticated = checkUserAuth(); // Your auth check function
      if (!isAuthenticated) {
        Navigator.of(context).push<void>(
          OnboardingScreen.route(),
        );
      } else {
        Navigator.of(context).push<void>(
          TodayScreen.route(),
        );
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
