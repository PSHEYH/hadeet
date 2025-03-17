import 'package:hadeet/models/user/user.dart';
import 'package:hadeet/repositories/user_repository.dart';

bool checkUserAuth() {
  final UserRepository userRepository = UserRepository.instance;
  User user = userRepository.getUserData();
  print(user);
  return user.name.isNotEmpty;
}
