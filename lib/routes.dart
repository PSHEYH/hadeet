import 'package:flutter/material.dart';
import 'package:hadeet/ui/onboarding/onboarding_screen.dart';
import 'package:hadeet/ui/settings/settings_screen.dart';
import 'package:hadeet/ui/setup/setup_screen.dart';
import 'package:hadeet/ui/splash/splash_screen.dart';
import 'package:hadeet/ui/today/today_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.route().settings.name!: (context) => SplashScreen(),
  OnboardingScreen.route().settings.name!: (context) => OnboardingScreen(),
  SetupScreen.route().settings.name!: (context) => SetupScreen(),
  TodayScreen.route().settings.name!: (context) => TodayScreen(),
  SettingsScreen.route().settings.name!: (context) => SettingsScreen()
};
