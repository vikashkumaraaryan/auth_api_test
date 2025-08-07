import 'package:auth_api_test/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Auth_api_test",
      home: SplashScreen(),
    );
  }
}
