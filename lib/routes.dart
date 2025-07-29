import 'package:go_router/go_router.dart';
import 'package:hadeet/ui/habit_creation/habit_creation_screen.dart';
import 'package:hadeet/ui/login/login_screen.dart';
import 'package:hadeet/ui/onboarding/onboarding_screen.dart';
import 'package:hadeet/ui/settings/settings_screen.dart';
import 'package:hadeet/ui/splash/splash_screen.dart';
import 'package:hadeet/ui/today/today_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: SplashScreen.routeName,
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      name: SplashScreen.routeName,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
        path: TodayScreen.routeName,
        name: TodayScreen.routeName,
        builder: (context, state) => const TodayScreen()),
    GoRoute(
        path: OnboardingScreen.routeName,
        name: OnboardingScreen.routeName,
        builder: (context, state) => const OnboardingScreen()),
    GoRoute(
        path: SettingsScreen.routeName,
        name: SettingsScreen.routeName,
        builder: (context, state) => const SettingsScreen()),
    GoRoute(
        path: HabitCreationScreen.routeName,
        name: HabitCreationScreen.routeName,
        builder: (context, state) => const HabitCreationScreen()),
  ],
);
