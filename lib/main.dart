import 'package:flutter/material.dart';

void main() {
  runApp(const MedFinderApp());
}

class MedFinderApp extends StatelessWidget {
  const MedFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedFinder',
      home: Scaffold(
        body: Center(
          child: Text(
            'Welcome to MedFinder',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}