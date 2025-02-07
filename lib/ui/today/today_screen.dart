
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/bloc/today/today_cubit.dart';
import 'package:hadeet/ui/today/today_view.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  const TodayScreen._();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const TodayScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF12151B),
        body: BlocProvider(
          create: (context) => TodayCubit(),
          child: const TodayView(),
        ));
  }
}
