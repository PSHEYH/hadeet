// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginState _$LoginStateFromJson(Map<String, dynamic> json) => LoginState(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      name: json['name'] as String? ?? '',
      reEnterPassword: json['reEnterPassword'] as String? ?? '',
      isTextFieldActive: json['isTextFieldActive'] as bool? ?? false,
      viewType: $enumDecodeNullable(_$LoginViewTypeEnumMap, json['viewType']) ??
          LoginViewType.email,
      isFirstTextFieldObscured:
          json['isFirstTextFieldObscured'] as bool? ?? true,
      isSecondTextFieldObscured:
          json['isSecondTextFieldObscured'] as bool? ?? true,
      status: $enumDecodeNullable(_$LoginStatusEnumMap, json['status']) ??
          LoginStatus.initial,
    );

Map<String, dynamic> _$LoginStateToJson(LoginState instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'reEnterPassword': instance.reEnterPassword,
      'isTextFieldActive': instance.isTextFieldActive,
      'isFirstTextFieldObscured': instance.isFirstTextFieldObscured,
      'isSecondTextFieldObscured': instance.isSecondTextFieldObscured,
      'status': _$LoginStatusEnumMap[instance.status]!,
      'viewType': _$LoginViewTypeEnumMap[instance.viewType]!,
    };

const _$LoginViewTypeEnumMap = {
  LoginViewType.email: 'email',
  LoginViewType.password: 'password',
  LoginViewType.signUpName: 'signUpName',
  LoginViewType.signUpRepeatPassword: 'signUpRepeatPassword',
};

const _$LoginStatusEnumMap = {
  LoginStatus.initial: 'initial',
  LoginStatus.loading: 'loading',
  LoginStatus.success: 'success',
  LoginStatus.error: 'error',
};
