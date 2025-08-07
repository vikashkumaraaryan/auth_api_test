import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("Welcome to home Page")],
        ),
      ),
    );
  }
}
