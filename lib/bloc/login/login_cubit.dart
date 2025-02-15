import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hadeet/models/login_view_type.dart';
import 'package:hadeet/ui/setup/setup_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_cubit.g.dart';
part 'login_state.dart';

class LoginCubit extends HydratedCubit<LoginState> {
  LoginCubit() : super(const LoginState());

  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  int countOfScreens = 0;

  onChangeText(String type, String value) {
    if (type == 'email') {
      emit(state.copyWith(email: value));
    } else if (type == 'name') {
      emit(state.copyWith(name: value));
    } else if (type == 'password') {
      emit(state.copyWith(password: value));
    } else {
      emit(state.copyWith(reEnterPassword: value));
    }
  }

  void onContinueTap(BuildContext context) {
    print('on continue');
    if (countOfScreens < LoginViewType.values.length - 1) {
      countOfScreens++;
      emit(state.copyWith(
          viewType: LoginViewType.values[countOfScreens],
          isTextFieldActive: false));
    } else {
      countOfScreens = 0;
      emit(state.copyWith(email: ''));
      Navigator.of(context).push(SetupScreen.route());
    }
  }

  void back() {
    if (countOfScreens > 0) {
      countOfScreens--;
      emit(state.copyWith(
          viewType: LoginViewType.values[countOfScreens],
          isTextFieldActive: false));
    }
  }

  void onTextFieldTap() {
    emit(state.copyWith(isTextFieldActive: true));
  }

  @override
  LoginState fromJson(Map<String, dynamic> json) => LoginState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    return state.toJson();
  }
}
