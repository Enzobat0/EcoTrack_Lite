import 'package:Ecotrack_lite/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcoTrackApp());
}

class EcoTrackApp extends StatelessWidget {
  const EcoTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoTrack',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AuthScreen(),
    );
  }
}
