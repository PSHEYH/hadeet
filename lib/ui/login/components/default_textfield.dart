import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key, required this.isTextInput, required this.onTap});

  final bool isTextInput;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isTextInput)
          Container(
            color: CustomTheme.of(context).colors.primary1,
            height: 2,
          ),
        TextField(
          maxLines: 1,
          style: CustomTheme.of(context).typography.headline16Bold.copyWith(
                color: CustomTheme.of(context).colors.neutral4,
              ),
          cursorColor: CustomTheme.of(context).colors.primary1,
          autofocus: false,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            onTap(value);
          },
          decoration: InputDecoration(
            hintText: 'Enter email',
            filled: true,
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
            suffix: isTextInput
                ? Bounce(
                    child: SvgPicture.asset(
                    AppIcons.closeSquare,
                    width: 20,
                    height: 20,
                  ))
                : null,
          ),
        ),
      ],
    );
  }
}
