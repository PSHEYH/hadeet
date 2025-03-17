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

  Widget getMainBody(LoginCubit cubit) {
    switch (cubit.state.viewType) {
      case LoginViewType.email:
        return LoginViewEmail(
          onChangeText: cubit.onChangeText,
          isTextFieldActive: cubit.state.isTextFieldActive,
          onTap: cubit.onTextFieldTap,
          onContinue: cubit.onContinueTap,
          onCloseTextField: cubit.onClearTextField,
          textEditingController: cubit.textEditingController,
        );
      case LoginViewType.password:
        return LoginViewPassword(
          isTextInput: cubit.state.isTextFieldActive,
          onChangeText: cubit.onChangeText,
          email: cubit.state.email,
          onTap: cubit.onTextFieldTap,
          onContinue: cubit.onContinueTap,
          onLogin: cubit.login,
          isObscured: cubit.state.isFirstTextFieldObscured,
          onObscureTap: cubit.onObscureTap,
        );
      case LoginViewType.signUpName:
        return LoginViewSignupName(
          isTextInput: cubit.state.isTextFieldActive,
          onChangeText: cubit.onChangeText,
          email: cubit.state.email,
          onTap: cubit.onTextFieldTap,
          onContinue: cubit.onContinueTap,
        );
      case LoginViewType.signUpRepeatPassword:
        return LoginViewSignupRepeatPassword(
          onChangeText: cubit.onChangeText,
          email: cubit.state.email,
          onTap: cubit.onTextFieldTap,
          onContinue: cubit.onContinueTap,
          isPasswordIdentical:
              cubit.state.password == cubit.state.reEnterPassword &&
                  cubit.state.password.isNotEmpty,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
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
              getMainBody(cubit),
            ],
          ),
        );
      },
    ));
  }
}
