import 'package:flutter/material.dart';

import 'core/navigation/bottom_navigation.dart';
import 'core/theme/app_theme.dart';

class MedFinderApp extends StatelessWidget {
  const MedFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedFinder',
      theme: AppTheme.lightTheme,

      // TEMPORARY:
      // Directly opens the main app for development.
      // We'll restore Splash -> Login -> Home later.
      home: const BottomNavigationPage(),
    );
  }
}
