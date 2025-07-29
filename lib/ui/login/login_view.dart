import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hadeet/bloc/login/login_cubit.dart';
import 'package:hadeet/models/login_view_type.dart';
import 'package:hadeet/ui/login/components/login_view_email.dart';
import 'package:hadeet/ui/login/components/login_view_password.dart';
import 'package:hadeet/ui/login/components/login_view_signup_name.dart';
import 'package:hadeet/ui/login/components/login_view_signup_repeat_password.dart';
import 'package:hadeet/ui/today/today_screen.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

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
    return SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        final cubit = context.read<LoginCubit>();
        if (state.viewType == LoginViewType.password ||
            state.viewType == LoginViewType.signUpRepeatPassword) {
          if (state.status == LoginStatus.loading) {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog.fullscreen(
                    backgroundColor: CustomTheme.of(context)
                        .colors
                        .neutral2
                        .withOpacity(0.4),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: CustomTheme.of(context).colors.primary1,
                      ),
                    ),
                  );
                },
                useSafeArea: false);
          } else if (state.status == LoginStatus.error) {
            GoRouter.of(context).pop();

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: CustomTheme.of(context).colors.semantic5,
              behavior: SnackBarBehavior.floating,
              elevation: 6,
              content: Text(
                cubit.errorMessage,
                style: CustomTheme.of(context)
                    .typography
                    .body14Medium
                    .copyWith(color: CustomTheme.of(context).colors.neutral4),
              ),
            ));
            cubit.returnToInitial();
          } else if (state.status == LoginStatus.success) {
            GoRouter.of(context).pop();
            GoRouter.of(context).pushNamed(TodayScreen.routeName);
          }
        }
      },
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
                    onTap: () {
                      cubit.back();
                    },
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
