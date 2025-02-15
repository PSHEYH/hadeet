import 'package:flutter/material.dart';

class AppColors {
  Color get primary1 => const Color(0xFF6C5DD3);
  Color get primary2 => const Color(0xFFCFC8FF);
  Color get semantic1 => const Color(0xFFFFA2C0);
  Color get semantic2 => const Color(0xFFFFCE73);
  Color get semantic3 => const Color(0xFFA0D7E7);
  Color get semantic4 => const Color(0xFFA5F59C);
  Color get semantic5 => const Color(0XFFE44F4F);
  Color get neutral1 => const Color(0xFF1B202A);
  Color get neutral2 => const Color(0xFF5E6272);
  Color get neutral3 => const Color(0xFF808191);
  Color get neutral4 => const Color(0xFFFFFFFF);
  Color get background1 => const Color(0xFF12151B);

  static LinearGradient get gradient1 => const LinearGradient(
      colors: [Color(0xFF8E96FF), Color(0xFF6C5DD3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static LinearGradient get gradient2 => const LinearGradient(
      colors: [Color(0xFF9ADB7F), Color(0xFF6EA95C)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static LinearGradient get gradient3 => const LinearGradient(
      colors: [Color(0xFFFFB28E), Color(0xFFFF7A55)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static LinearGradient get gradient4 => const LinearGradient(
      colors: [Color(0xFFBBFFE7), Color(0xFF86FFCA)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static LinearGradient get gradient5 => const LinearGradient(
      colors: [Color(0xFFCDE7FF), Color(0xFFCDE7FF)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static LinearGradient get gradient6 => const LinearGradient(
      colors: [Color(0xFFE2BDFF), Color(0xFFDBB0FD)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static LinearGradient get gradient7 => const LinearGradient(colors: [
        Color(0xFF4268DB),
        Color(0xFF558CE4),
        Color(0xFF69B1EE),
        Color(0xFF78CFF5),
        Color(0xFF83E3FB),
        Color(0xFF83E3FB),
        Color(0xFF8AF0FE),
        Color(0xFF8CF4FF),
      ], begin: Alignment.bottomLeft, end: Alignment.topRight);
  static LinearGradient get linear1 => LinearGradient(
      colors: [const Color(0xFFFFFFFF).withOpacity(0), const Color(0xFFFFFFFF)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
}

class AppColorsLight extends AppColors {}

class AppColorsDark extends AppColors {
  Color get primary1 => const Color(0xFF6C5DD3);
  Color get primary2 => const Color(0xFFCFC8FF);
  Color get semantic1 => const Color(0xFFFFA2C0);
  Color get semantic2 => const Color(0xFFFFCE73);
  Color get semantic3 => const Color(0xFFA0D7E7);
  Color get semantic4 => const Color(0xFFA5F59C);
  Color get semantic5 => const Color(0XFFE44F4F);
  Color get neutral1 => const Color(0xFF1B202A);
  Color get neutral2 => const Color(0xFF5E6272);
  Color get neutral3 => const Color(0xFF808191);
  Color get neutral4 => const Color(0xFFFFFFFF);
  Color get background1 => const Color(0xFF12151B);

  LinearGradient get gradient1 => const LinearGradient(
      colors: [Color(0xFF8E96FF), Color(0xFF6C5DD3)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  LinearGradient get gradient2 => const LinearGradient(
      colors: [Color(0xFF9ADB7F), Color(0xFF6EA95C)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  LinearGradient get gradient3 => const LinearGradient(
      colors: [Color(0xFFFFB28E), Color(0xFFFF7A55)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  LinearGradient get gradient4 => const LinearGradient(
      colors: [Color(0xFFBBFFE7), Color(0xFF86FFCA)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  LinearGradient get gradient5 => const LinearGradient(
      colors: [Color(0xFFCDE7FF), Color(0xFFCDE7FF)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  LinearGradient get gradient6 => const LinearGradient(
      colors: [Color(0xFFE2BDFF), Color(0xFFDBB0FD)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  LinearGradient get gradient7 => const LinearGradient(colors: [
        Color(0xFF4268DB),
        Color(0xFF558CE4),
        Color(0xFF69B1EE),
        Color(0xFF78CFF5),
        Color(0xFF83E3FB),
        Color(0xFF83E3FB),
        Color(0xFF8AF0FE),
        Color(0xFF8CF4FF),
      ], begin: Alignment.bottomLeft, end: Alignment.topRight);
}
