import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_cubit.g.dart';
part 'login_state.dart';

class LoginCubit extends HydratedCubit<LoginState> {
  LoginCubit() : super(LoginState());

  TextEditingController textEditingController = TextEditingController();

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

  @override
  LoginState fromJson(Map<String, dynamic> json) => LoginState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    return state.toJson();
  }
}
