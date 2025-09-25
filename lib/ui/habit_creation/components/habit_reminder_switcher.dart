import 'package:flutter/material.dart';

class HabitReminderSwitcher extends StatelessWidget {
  const HabitReminderSwitcher({super.key, required this.value, required this.inactiveThumbColor, required this.inactiveTrackColor, required this.activeColorGradient, required this.activeColorThumb, required this.onSwitch});

  final bool value;
  final Function() onSwitch;
  final LinearGradient activeColorGradient;
  final LinearGradient activeColorThumb;
  final Color inactiveTrackColor;
  final Color inactiveThumbColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSwitch,
      child: Container(
        width: 48,
        height: 24,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            gradient: value ? activeColorGradient : null,
            color: value ? null : inactiveTrackColor),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: value ? Alignment.topRight : Alignment.topLeft,
              duration: const Duration(milliseconds: 200),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: value ? null : inactiveThumbColor,
                    gradient: value ? activeColorThumb : null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
