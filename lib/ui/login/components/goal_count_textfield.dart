import 'package:flutter/material.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class GoalCountTextField extends StatelessWidget {
  const GoalCountTextField(
      {super.key, required this.goal, required this.focusNode, this.onTap});
  final String goal;
  final Function()? onTap;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          focusNode: focusNode,
          maxLines: 1,
          style: CustomTheme.of(context).typography.headline16Bold.copyWith(
                color: CustomTheme.of(context).colors.neutral4,
              ),
          cursorColor: CustomTheme.of(context).colors.primary1,
          autofocus: false,
          keyboardType: TextInputType.phone,
          keyboardAppearance: Brightness.dark,
          onChanged: (value) {},
          onTap: () {
            onTap != null ? onTap!() : ();
          },
          decoration: InputDecoration(
            hintText: goal,
            fillColor: CustomTheme.of(context).colors.neutral1,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            suffixText: goal,
            suffixStyle: CustomTheme.of(context)
                .typography
                .headline16Medium
                .copyWith(color: CustomTheme.of(context).colors.neutral2),
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
          ),
        ),
      ],
    );
  }
}
