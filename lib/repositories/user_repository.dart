
import 'package:get_storage/get_storage.dart';
import 'package:hadeet/models/user/user.dart';

class UserRepository {
  static final UserRepository instance = UserRepository._internal();

  UserRepository._internal();

  final _box = GetStorage();

  void saveUser(User user){
    _box.write('user_data', user.toJson());
  }

  User getUserData(){
    final res = _box.read('user_data');
    return res == null ? const User(name: '', token: '', refreshToken: '') : User.fromJson(res);
  }

}
