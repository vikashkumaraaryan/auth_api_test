import 'dart:convert';

import 'package:auth_api_test/models/login_model.dart';
import 'package:auth_api_test/models/signup_model.dart';
import 'package:http/http.dart' as http;

class AuthService {

  static Future<LoginModel?> login(String email, String password) async {
    final url = Uri.parse("put your login api");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );
      print("login res" + response.body);
      if (response.statusCode == 200) {
        return loginModelFromJson(response.body);
      }
    } catch (e) {
      print("login error $e");
    }
    return null;
  }
  static Future<SignUpModel?> signup(String name,String email,String password,String mobile,) async {
    final url = Uri.parse(
      "put your signup api",);
    try {
      final response = await http.post(url, headers: {"Content-Type": "application/json"},
        body: jsonEncode({"last_name": name,"email": email,"password": password,"number": mobile, "first_name": name}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        var jsonRes = jsonDecode(response.body);
        return SignUpModel.fromJson(jsonRes);
      }
    } catch (e) {
      print("signup error: $e");
    }
    return null;
  }
}
