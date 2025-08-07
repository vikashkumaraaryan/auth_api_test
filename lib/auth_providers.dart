import 'package:auth_api_test/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;

  bool get isLoggedIn => _token != null;

  String? get token => _token;

  Future<bool> login(String email, String password) async {
    final loginModel = await AuthService.login(email, password);

    if (loginModel != null && loginModel.accessToken != null) {
      _token = loginModel.accessToken;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', _token!);
      notifyListeners();
      return true;
    }

    return false;
  }

  Future<bool> signup(
    String name,
    String email,
    String password,
    String mobile,
  ) async {
    final signupModel = await AuthService.signup(name, email, password, mobile);

    if (signupModel != null && signupModel.message!=null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', _token!);

      notifyListeners();
      return true;
    }

    return false;
  }
}
