import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/bloc/login/login_cubit.dart';
import 'package:hadeet/models/login_view_type.dart';
import 'package:hadeet/ui/login/components/login_view_email.dart';
import 'package:hadeet/ui/login/components/login_view_password.dart';
import 'package:hadeet/ui/login/components/login_view_signup_name.dart';
import 'package:hadeet/ui/login/components/login_view_signup_repeat_password.dart';
import 'package:hadeet/uikit/assets/icons.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  Widget getMainBody(LoginCubit controller) {
    switch (controller.state.viewType) {
      case LoginViewType.email:
        return LoginViewEmail(
            email: controller.state.email,
            onChangeText: controller.onChangeText,
            isTextFieldActive: controller.state.isTextFieldActive,
            onTap: controller.onTextFieldTap,
            onContinue: controller.onContinueTap);
      case LoginViewType.password:
        return LoginViewPassword(
          isTextInput: controller.state.isTextFieldActive,
          onChangeText: controller.onChangeText,
          email: controller.state.email,
          onTap: controller.onTextFieldTap,
          onContinue: controller.onContinueTap,
          onLogin: controller.login,
          isObscured: controller.state.isFirstTextFieldObscured,
        );
      case LoginViewType.signUpName:
        return LoginViewSignupName(
          isTextInput: controller.state.isTextFieldActive,
          onChangeText: controller.onChangeText,
          email: controller.state.email,
          onTap: controller.onTextFieldTap,
          onContinue: controller.onContinueTap,
        );
      case LoginViewType.signUpRepeatPassword:
        return LoginViewSignupRepeatPassword(
          onChangeText: controller.onChangeText,
          email: controller.state.email,
          onTap: controller.onTextFieldTap,
          onContinue: controller.onContinueTap,
          isPasswordIdentical:
              controller.state.password == controller.state.reEnterPassword &&
                  controller.state.password.isNotEmpty,
        );
    }
  }

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
              getMainBody(controller),
            ],
          ),
        );
      },
    ));
  }
}
