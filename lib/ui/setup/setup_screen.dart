import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/bloc/setup/setup_cubit.dart';
import 'package:hadeet/ui/setup/setup_view.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  const SetupScreen._();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: '/setup'),
      builder: (_) => BlocProvider(
        create: (context) => SetupCubit(),
        child: const SetupScreen._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF12151B), body: SetupView());
  }
}
