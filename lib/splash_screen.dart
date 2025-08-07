import 'package:auth_api_test/page/auth_page/login_page.dart';
import 'package:auth_api_test/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    await Future.delayed(Duration(seconds: 3,));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('auth_token');
    if (!mounted) return;
    if (token != null && token.isNotEmpty) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [FlutterLogo(size: 100), Text("Welcome To Splash Screen")],
        ),
      ),
    );
  }
}
