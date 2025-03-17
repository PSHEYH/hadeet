import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/bloc/settings/settings_cubit.dart';
import 'package:hadeet/ui/settings/components/settings_menu_button.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
      final controller = context.read<SettingsCubit>();
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset("assets/images/settings_picture.png"),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                    radius: 20,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('Thao Lee ',
                      style: CustomTheme.of(context)
                          .typography
                          .title20Bold
                          .copyWith(
                              color: CustomTheme.of(context).colors.neutral4)),
                  const SizedBox(
                    height: 40,
                  ),
                  ...controller.buttons.asMap().entries.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 36),
                      child: SettingsMenuButton(
                          icon: e.value.icon,
                          isActive: controller.state.currentIndex == e.key,
                          title: e.value.title,
                          onTap: () {
                            controller.onButtonTap(e.key, context);
                          })))
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
