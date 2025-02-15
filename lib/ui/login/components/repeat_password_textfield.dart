import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class RepeatPasswordTextField extends StatelessWidget {
  const RepeatPasswordTextField(
      {super.key,
      required this.isPasswordIdentical,
      required this.onChangeText,
      required this.onTap});

  final bool isPasswordIdentical;
  final Function(String) onChangeText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      style: CustomTheme.of(context).typography.headline16Bold.copyWith(
            color: CustomTheme.of(context).colors.neutral4,
          ),
      cursorColor: CustomTheme.of(context).colors.primary1,
      autofocus: false,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        onChangeText(value);
      },
      onTap: () {
        onTap();
      },
      obscureText: true,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        filled: true,
        hintText: 'Enter password',
        fillColor: CustomTheme.of(context).colors.neutral1,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          borderSide: BorderSide.none,
        ),
        hintStyle:
            CustomTheme.of(context).typography.headline16Semibold.copyWith(
                  color: CustomTheme.of(context).colors.neutral2,
                ),
        helperStyle:
            CustomTheme.of(context).typography.headline16Semibold.copyWith(
                  color: CustomTheme.of(context).colors.neutral2,
                ),
        suffixIcon: isPasswordIdentical
            ? Padding(
                padding: const EdgeInsets.all(18),
                child: SvgPicture.asset(AppIcons.success),
              )
            : null,
      ),
    );
  }
}
