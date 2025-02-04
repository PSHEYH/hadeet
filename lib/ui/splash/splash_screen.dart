import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/ui/onboarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _timer?.cancel();
      timer.cancel();
      Navigator.of(context).push<void>(
        OnboardingScreen.route(),
      );
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
