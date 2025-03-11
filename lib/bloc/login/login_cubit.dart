import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hadeet/api/api_service.dart';
import 'package:hadeet/models/login_view_type.dart';
import 'package:hadeet/models/user/user.dart';
import 'package:hadeet/repositories/user_repository.dart';
import 'package:hadeet/ui/setup/setup_screen.dart';
import 'package:hadeet/ui/today/today_screen.dart';
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
      User? user = await ApiService.signUp(
          email: state.email, password: state.password, name: state.name);
      if (user != null) {
        _userRepository.saveUser(user);
        Navigator.of(context).push(SetupScreen.route());
      } else {
        print('Request error');
      }
    }
  }

  void login(BuildContext context) async {
    User? user =
        await ApiService.login(email: state.email, password: state.password);
    if (user != null) {
      _userRepository.saveUser(user);
      Navigator.of(context).push(TodayScreen.route());
    } else {
      print('Request error');
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
}
