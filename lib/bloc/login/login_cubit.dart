import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hadeet/api/api_service.dart';
import 'package:hadeet/models/login_view_type.dart';
import 'package:hadeet/models/user/user.dart';
import 'package:hadeet/repositories/user_repository.dart';
import 'package:hadeet/ui/setup/setup_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_cubit.g.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  TextEditingController textEditingController = TextEditingController();
  final UserRepository _userRepository = UserRepository.instance;
  FocusNode focusNode = FocusNode();
  int countOfScreens = 0;
  String errorMessage = '';

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

  void onContinueTap(BuildContext context) async {
    if (textEditingController.text.isEmpty) {
      return;
    }
    if (countOfScreens < LoginViewType.values.length - 1) {
      countOfScreens++;
      emit(state.copyWith(
          viewType: LoginViewType.values[countOfScreens],
          isTextFieldActive: false));
    } else {
      try {
        User user = await ApiService.signUp(
            email: state.email, password: state.password, name: state.name);
        _userRepository.saveUser(user);
        if (context.mounted) {
          Navigator.of(context).push(SetupScreen.route());
        }
      } on ApiException catch (e) {
        errorMessage = e.message;
      }
    }
  }

  void login() async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      User user =
          await ApiService.login(email: state.email, password: state.password);

      emit(state.copyWith(status: LoginStatus.success));
      _userRepository.saveUser(user);
    } on ApiException catch (e) {
      errorMessage = e.message;
      emit(state.copyWith(status: LoginStatus.error));
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

  void returnToInitial() {
    emit(state.copyWith(status: LoginStatus.initial));
  }

  @override
  void onChange(change) {
    super.onChange(change);
  }

  @override
  Future<void> close() async {
    print('Bloc closed');
    super.close();
  }

  void onObscureTap() {
    emit(state.copyWith(
        isFirstTextFieldObscured: !state.isFirstTextFieldObscured));
  }

  void onClearTextField() {
    textEditingController.clear();
    if (state.viewType == LoginViewType.email) {
      emit(state.copyWith(email: ''));
    } else if (state.viewType == LoginViewType.signUpName) {
      emit(state.copyWith(name: ''));
    } else if (state.viewType == LoginViewType.password) {
      emit(state.copyWith(password: ''));
    } else {
      emit(state.copyWith(reEnterPassword: ''));
    }
  }
}
