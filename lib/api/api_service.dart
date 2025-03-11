import 'dart:convert';

import 'package:hadeet/models/user/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<User?> login({ required String email,required String password}) async{

     try {
      final Map<String, dynamic> parameters = {
        'email': email,
        'password': password
      };

      var url = Uri.https('url', '/v1/login',
          parameters.map((key, value) => MapEntry(key, value.toString())));
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        print('error: ${response.body}, statusCode: ${response.statusCode}');
        return null;
      }
    } catch (e, stacktrace) {
      print(stacktrace);
      print(e);
      return null;
    }
  }

  static Future<User?> signUp({required String email, required String password,  required String name}) async{
    try {
      final Map<String, dynamic> parameters = {
        'name': name,
        'email': email,
        'password': password
      };

      var url = Uri.https('url', '/v1/signUp',
          parameters.map((key, value) => MapEntry(key, value.toString())));
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        print('error: ${response.body}, statusCode: ${response.statusCode}');
        return null;
      }
    } catch (e, stacktrace) {
      print(stacktrace);
      print(e);
      return null;
    }
  }

  static loginWithGoogle() async{

  }

  static loginWithFacebook() async{

  }
}