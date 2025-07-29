import 'package:flutter/material.dart';
import 'package:hadeet/ui/login/components/button_primary_text.dart';
import 'package:hadeet/ui/login/components/default_textfield.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class LoginViewEmail extends StatelessWidget {
  const LoginViewEmail({
    super.key,
    required this.onChangeText,
    required this.isTextFieldActive,
    required this.onTap,
    required this.onContinue,
    required this.onCloseTextField,
    required this.textEditingController,
  });

  final bool isTextFieldActive;
  final Function() onTap;
  final Function() onCloseTextField;
  final Function(String, String) onChangeText;
  final Function(BuildContext) onContinue;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('What’s your email address?',
            style: CustomTheme.of(context)
                .typography
                .title30Bold
                .copyWith(color: CustomTheme.of(context).colors.neutral4)),
        const SizedBox(
          height: 24,
        ),
        Text('Your Email',
            style: CustomTheme.of(context)
                .typography
                .body14Semibold
                .copyWith(color: CustomTheme.of(context).colors.neutral3)),
        const SizedBox(
          height: 12,
        ),
        DefaultTextField(
          color: CustomTheme.of(context).colors.primary1,
          isTextInput: isTextFieldActive,
          textEditingController: textEditingController,
          onTap: onTap,
          onClose: onCloseTextField,
          onChangeText: (String value) {
            onChangeText('email', value);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: ButtonPrimaryText(
              text: 'Continue',
              onTap: () {
                onContinue(context);
              }),
        ),
      ],
    );
  }
}
