import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/ui/login/components/default_textfield.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class PasswordTextField extends DefaultTextField {
  const PasswordTextField(
      {super.key,
      required super.isTextInput,
      required super.onChangeText,
      required super.onTap,
      required this.isObscured});

  final bool isObscured;

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
        hintText: 'Enter password',
        filled: isObscured,
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
        suffixIcon: Bounce(
            child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: SvgPicture.asset(
            isObscured ? AppIcons.unHide : AppIcons.hide,
          ),
        )),
      ),
    );
  }
}
