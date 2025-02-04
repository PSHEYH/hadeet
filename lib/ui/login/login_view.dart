import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/bloc/login/login_cubit.dart';
import 'package:hadeet/ui/login/components/button_primary_text.dart';
import 'package:hadeet/ui/login/components/default_textfield.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final controller = context.read<LoginCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: (16 / 812) * MediaQuery.of(context).size.height,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Bounce(
                    child: SvgPicture.asset(
                  AppIcons.arrowLeftSquare,
                  width: 28,
                  height: 28,
                )),
              ),
              const SizedBox(
                height: 16,
              ),
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
                  isTextInput: controller.state.email.isNotEmpty,
                  onTap: (String value) {
                    controller.onChangeText('email', value);
                  }),
              if (controller.state.email.isNotEmpty)
                Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: ButtonPrimaryText(text: 'Continue', onTap: () {}))
            ],
          ),
        );
      },
    ));
  }
}
