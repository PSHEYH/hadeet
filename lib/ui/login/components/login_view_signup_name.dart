import 'package:flutter/material.dart';
import 'package:hadeet/ui/login/components/button_primary_text.dart';
import 'package:hadeet/ui/login/components/default_textfield.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class LoginViewSignupName extends StatelessWidget {
  const LoginViewSignupName(
      {super.key,
      required this.isTextInput,
      required this.onChangeText,
      required this.email,
      required this.onTap,
      required this.onContinue});

  final bool isTextInput;
  final Function(String, String) onChangeText;
  final String email;
  final Function() onTap;
  final Function(BuildContext) onContinue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
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
              text: ' sign up',
              style: CustomTheme.of(context)
                  .typography
                  .body14Medium
                  .copyWith(color: CustomTheme.of(context).colors.neutral2)),
        ])),
        const SizedBox(
          height: 36,
        ),
        Text('Your Name',
            style: CustomTheme.of(context)
                .typography
                .body14Semibold
                .copyWith(color: CustomTheme.of(context).colors.neutral3)),
        const SizedBox(
          height: 12,
        ),
        DefaultTextField(
            isTextInput: isTextInput,
            onTap: onTap,
            onChangeText: (String value) {
              onChangeText('name', value);
            }),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: ButtonPrimaryText(
              text: 'Continue',
              onTap: () {
                onContinue(context);
              }),
        )
      ],
    );
  }
}
