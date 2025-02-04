part of 'login_cubit.dart';

@JsonSerializable()
final class LoginState extends Equatable {
  const LoginState(
      {this.email = '',
      this.password = '',
      this.name = '',
      this.reEnterPassword = ''});

  final String email;
  final String password;
  final String name;
  final String reEnterPassword;

  factory LoginState.fromJson(Map<String, dynamic> json) =>
      _$LoginStateFromJson(json);

  Map<String, dynamic> toJson() => _$LoginStateToJson(this);

  @override
  List<Object?> get props => [email, password, name, reEnterPassword];

  LoginState copyWith(
      {String? email,
      String? name,
      String? password,
      String? reEnterPassword}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        reEnterPassword: reEnterPassword ?? this.reEnterPassword);
  }
}
