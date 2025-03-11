import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User(
      {required this.name, required this.token, required this.refreshToken});

  final String name;
  final String token;
  final String refreshToken;

  @override
  List<Object?> get props => [name, token, refreshToken];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({String? name, String? token, String? refreshToken}) {
    return User(
        name: name ?? this.name,
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken);
  }
}
