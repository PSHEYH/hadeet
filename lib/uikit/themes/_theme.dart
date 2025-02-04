import 'package:flutter/material.dart';

import '_app_colors.dart';
import '_app_themes.dart';
import '_app_typography.dart';

class CustomTheme extends StatefulWidget {
  final Widget child;

  const CustomTheme({super.key, required this.child});

  static ThemeInheritedWidget of(BuildContext context) {
    final ThemeInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
    assert(result != null, 'No ThemeInheritedWidget found in context');

    return result!;
  }

  @override
  State<CustomTheme> createState() => _CustomThemeState();
}

class _CustomThemeState extends State<CustomTheme> {
  AppTheme theme = AppTheme(
    colors: AppColorsDark(),
    typography: AppTypography(),
  );

  void changeTheme() {}

  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(
      theme: theme,
      changeTheme: changeTheme,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.noScaling,
          boldText: false,
          invertColors: false,
          highContrast: false,
          disableAnimations: false,
        ),
        child: widget.child,
      ),
    );
  }
}

class ThemeInheritedWidget extends InheritedWidget {
  final AppTheme theme;
  final Function() changeTheme;

  const ThemeInheritedWidget({
    super.key,
    required this.theme,
    required this.changeTheme,
    required super.child,
  });

  AppColors get colors => theme.colors;

  AppTypography get typography => theme.typography;

  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    return theme != oldWidget.theme;
  }
}
