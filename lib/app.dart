import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/presentation/splash_screen.dart';

class MedFinderApp extends StatelessWidget {
  const MedFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedFinder',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
