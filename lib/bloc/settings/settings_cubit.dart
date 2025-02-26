import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings_cubit.g.dart';
part 'settings_state.dart';

class MenuButtonSignature {
  const MenuButtonSignature({required this.title, required this.icon});

  final String title;
  final String icon;
}

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  List<MenuButtonSignature> buttons = const [
    MenuButtonSignature(title: 'Today', icon: AppIcons.calendar),
    MenuButtonSignature(title: 'Your stats', icon: AppIcons.stats),
    MenuButtonSignature(title: 'Notifications', icon: AppIcons.notifications),
    MenuButtonSignature(title: 'Settings', icon: AppIcons.settings),
  ];

  onButtonTap(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
