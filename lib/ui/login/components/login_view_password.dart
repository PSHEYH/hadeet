import 'package:flutter/material.dart';
import 'package:hadeet/ui/login/components/button_primary_text.dart';
import 'package:hadeet/ui/login/components/password_textfield.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class LoginViewPassword extends StatelessWidget {
  const LoginViewPassword(
      {super.key,
      required this.isTextInput,
      required this.onChangeText,
      required this.email,
      required this.onTap,
      required this.onContinue,
      required this.onLogin,
      required this.isObscured,
      required this.onObscureTap});

  final bool isTextInput;
  final bool isObscured;
  final Function(String, String) onChangeText;
  final String email;
  final Function() onTap;
  final Function() onObscureTap;
  final Function(BuildContext) onContinue;
  final Function() onLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Log In',
            style: CustomTheme.of(context)
                .typography
                .title30Bold
                .copyWith(color: CustomTheme.of(context).colors.neutral4)),
        const SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: 'Using ',
              style: CustomTheme.of(context)
                  .typography
                  .body14Medium
                  .copyWith(color: CustomTheme.of(context).colors.neutral2)),
          TextSpan(
              text: email,
              style: CustomTheme.of(context).typography.body14Medium.copyWith(
                  color: CustomTheme.of(context).colors.semantic3,
                  decorationColor: CustomTheme.of(context).colors.semantic3,
                  decoration: TextDecoration.underline)),
          TextSpan(
              text: ' to login',
              style: CustomTheme.of(context)
                  .typography
                  .body14Medium
                  .copyWith(color: CustomTheme.of(context).colors.neutral2)),
        ])),
        const SizedBox(
          height: 36,
        ),
        Text('Your password',
            style: CustomTheme.of(context)
                .typography
                .body14Semibold
                .copyWith(color: CustomTheme.of(context).colors.neutral3)),
        const SizedBox(
          height: 12,
        ),
        PasswordTextField(
            color: CustomTheme.of(context).colors.primary1,
            isTextInput: isTextInput,
            onTap: onTap,
            onObscureTap: onObscureTap,
            onChangeText: (String value) {
              onChangeText('password', value);
            },
            isObscured: isObscured),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: ButtonPrimaryText(
              text: 'Continue',
              onTap: () {
                onLogin();
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: ButtonPrimaryText(
              text: 'Sign up',
              onTap: () {
                onContinue(context);
              }),
        )
      ],
    );
  }
}
