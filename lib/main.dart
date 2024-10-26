import 'package:flutter/material.dart';
import 'screens/launch_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/settings_image_screen.dart'; // Make sure to import the settings image screen.

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoTrack Lite',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const LaunchScreen(),
      routes: {
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/settings-image': (context) => const SettingsImageScreen(),
      },
    );
  }
}

class SettingsImageScreen extends StatelessWidget {
  const SettingsImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Image'),
      ),
      body: const Center(
        child: Text('Settings Image Screen'),
      ),
    );
  }
}
