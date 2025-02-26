import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/bloc/settings/settings_cubit.dart';
import 'package:hadeet/ui/settings/settings_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  const SettingsScreen._();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: '/settings'),
      builder: (_) => const SettingsScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF12151B),
        body: BlocProvider(
          create: (context) => SettingsCubit(),
          child: const SettingsView(),
        ));
  }
}
