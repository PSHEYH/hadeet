part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

@JsonSerializable()
final class LoginState extends Equatable {
  const LoginState(
      {this.email = '',
      this.password = '',
      this.name = '',
      this.reEnterPassword = '',
      this.isTextFieldActive = false,
      this.viewType = LoginViewType.email,
      this.isFirstTextFieldObscured = true,
      this.isSecondTextFieldObscured = true,
      this.status = LoginStatus.initial});

  final String email;
  final String password;
  final String name;
  final String reEnterPassword;
  final bool isTextFieldActive;
  final bool isFirstTextFieldObscured;
  final bool isSecondTextFieldObscured;
  final LoginStatus status;
  final LoginViewType viewType;

  factory LoginState.fromJson(Map<String, dynamic> json) =>
      _$LoginStateFromJson(json);

  Map<String, dynamic> toJson() => _$LoginStateToJson(this);

  @override
  List<Object?> get props => [
        email,
        password,
        name,
        reEnterPassword,
        isTextFieldActive,
        viewType,
        isFirstTextFieldObscured,
        status
      ];

  LoginState copyWith(
      {String? email,
      String? name,
      String? password,
      String? reEnterPassword,
      bool? isTextFieldActive,
      LoginViewType? viewType,
      bool? isFirstTextFieldObscured,
      bool? isSecondTextFieldObscured,
      LoginStatus? status}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        reEnterPassword: reEnterPassword ?? this.reEnterPassword,
        isTextFieldActive: isTextFieldActive ?? this.isTextFieldActive,
        viewType: viewType ?? this.viewType,
        isFirstTextFieldObscured:
            isFirstTextFieldObscured ?? this.isFirstTextFieldObscured,
        isSecondTextFieldObscured:
            isSecondTextFieldObscured ?? this.isSecondTextFieldObscured,
        status: status ?? this.status);
  }
}
