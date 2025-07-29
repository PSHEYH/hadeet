import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeet/bloc/login/login_cubit.dart';
import 'package:hadeet/ui/login/login_view.dart';
import 'package:hadeet/uikit/themes/_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.of(context).colors.background1,
        body: BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginView(),
        ));
  }
}
