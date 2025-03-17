import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hadeet/models/user/user.dart';
import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final String message;
  ApiException(this.message);
}

class ApiService {
  static Future<User> login(
      {required String email, required String password}) async {
    final Map<String, dynamic> body = {
      'input': {'email': email, 'password': password}
    };

    var url = Uri.https(dotenv.env['SERVER_NAME']!, '/api/login');
    var response = await http.post(url,
        headers: {'webhook-secret': dotenv.env['WEBHOOK_SECRET']!},
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      print('error: ${response.body}, statusCode: ${response.statusCode}');
      Map<String, dynamic> errorResponse = jsonDecode(response.body);
      throw ApiException(errorResponse['body']!);
    }
  }

  static Future<User> signUp(
      {required String email,
      required String password,
      required String name}) async {
    final Map<String, dynamic> body = {
      'input': {'name': name, 'email': email, 'password': password}
    };

    var url = Uri.https(dotenv.env['SERVER_NAME']!, '/api/signUp');
    var response = await http.post(url,
        body: jsonEncode(body),
        headers: {'webhook-secret': dotenv.env['WEBHOOK_SECRET']!});
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      print('error: ${response.body}, statusCode: ${response.statusCode}');
      Map<String, dynamic> errorResponse = jsonDecode(response.body);
      throw ApiException(errorResponse['body']!);
    }
  }

  static loginWithGoogle() async {}

  static loginWithFacebook() async {}
}
