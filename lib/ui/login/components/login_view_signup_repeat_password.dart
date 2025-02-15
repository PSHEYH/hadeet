import 'package:flutter/material.dart';
import 'package:hadeet/ui/login/components/button_primary_text.dart';
import 'package:hadeet/ui/login/components/repeat_password_textfield.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class LoginViewSignupRepeatPassword extends StatelessWidget {
  const LoginViewSignupRepeatPassword(
      {super.key,
      required this.onChangeText,
      required this.email,
      required this.onTap,
      required this.onContinue,
      required this.isPasswordIdentical});

  final String email;
  final bool isPasswordIdentical;
  final Function(String, String) onChangeText;
  final Function() onTap;
  final Function(BuildContext) onContinue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Sign Up',
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
                    decoration: TextDecoration.underline,
                    decorationColor: CustomTheme.of(context).colors.semantic3)),
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
          Text('Your Password',
              style: CustomTheme.of(context)
                  .typography
                  .body14Semibold
                  .copyWith(color: CustomTheme.of(context).colors.neutral3)),
          const SizedBox(
            height: 12,
          ),
          RepeatPasswordTextField(
            onTap: () {},
            onChangeText: (String value) {
              onChangeText('password', value);
            },
            isPasswordIdentical: isPasswordIdentical,
          ),
          const SizedBox(
            height: 24,
          ),
          Text('Re-enter Password',
              style: CustomTheme.of(context)
                  .typography
                  .body14Semibold
                  .copyWith(color: CustomTheme.of(context).colors.neutral3)),
          const SizedBox(
            height: 12,
          ),
          RepeatPasswordTextField(
            onTap: onTap,
            onChangeText: (String value) {
              onChangeText('repeat_password', value);
            },
            isPasswordIdentical: isPasswordIdentical,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: ButtonPrimaryText(
                text: 'Continue',
                onTap: () {
                  onContinue(context);
                }),
          )
        ],
      ),
    );
  }
}
