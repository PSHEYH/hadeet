

import 'package:flutter/material.dart';
import 'package:hadeet/ui/login/components/button_primary_text.dart';
import 'package:hadeet/ui/login/components/default_textfield.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class LoginViewPassword extends StatelessWidget {
  const LoginViewPassword({super.key, required this.isTextInput, required this.onChangeText});

  final bool isTextInput;
  final Function() onChangeText;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('What’s your email address?',
            style: CustomTheme.of(context)
                .typography
                .title30Bold
                .copyWith(
                color: CustomTheme.of(context).colors.neutral4)),
        const SizedBox(
          height: 24,
        ),
        Text('Your Email',
            style: CustomTheme.of(context)
                .typography
                .body14Semibold
                .copyWith(
                color: CustomTheme.of(context).colors.neutral3)),
        const SizedBox(
          height: 12,
        ),
        DefaultTextField(
            isTextInput: isTextInput,
            onTap: (String value) {
              onChangeText();
            }),

          Padding(
              padding: const EdgeInsets.only(top: 24),
              child: ButtonPrimaryText(text: 'Continue', onTap: () {}))
      ],
    );
  }
}
