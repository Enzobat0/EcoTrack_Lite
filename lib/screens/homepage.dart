import 'dart:math'; // For generating random values
import 'package:ecotrack_lite/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:ecotrack_lite/screens/step1.dart';
import 'package:ecotrack_lite/screens/ecotips.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

void main() {
  runApp(EcoTrackLiteApp());
}

class EcoTrackLiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      title: 'EcoTrack Lite',
      theme: ThemeData(
        primaryColor: const Color(0xff34A353),
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme, // Apply DM Sans font to the text theme
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  static const Color primaryColor = Color(0xff34A353);

  // Random value generator for the demo
  final double totalFootprint = Random().nextDouble() * 10 + 5; // 5 to 15 tons
  final double mobility = Random().nextDouble() * 5; // 0 to 5 tons
  final double housing = Random().nextDouble() * 5; // 0 to 5 tons
  final double diet = Random().nextDouble() * 5; // 0 to 5 tons
  final double spending = Random().nextDouble() * 5; // 0 to 5 tons

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        // Added SingleChildScrollView
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'This is your annual carbon footprint:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              '${totalFootprint.toStringAsFixed(2)} Tons CO₂',
              style: TextStyle(
                color: primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Understand your footprint:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBaton('Mobility', mobility, totalFootprint, screenWidth),
                _buildBaton('Housing', housing, totalFootprint, screenWidth),
                _buildBaton('Diet', diet, totalFootprint, screenWidth),
                _buildBaton('Spending', spending, totalFootprint, screenWidth),
              ],
            ),
            const SizedBox(height: 20), // Space before the button
            Align(
              alignment: Alignment.centerLeft, // Align to the left
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FoodHabits()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White background
                  side: BorderSide(color: primaryColor), // Primary color border
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Text(
                  'Recalculate',
                  style: TextStyle(
                      color: primaryColor, fontSize: 20), // Primary color text
                ),
              ),
            ),
            const SizedBox(height: 20), // Optional: Space at the bottom
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xff34A353)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb, color: Color(0xff34A353)),
            label: 'EcoTips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xff34A353)),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Set the current index to 0 for the home tab
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation based on the index tapped
          switch (index) {
            case 0:
              // Already on home

              break;
            case 1:
              // Navigate to EcoTips
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EcoTipsPage()));
              break;
            case 2:
              // Navigate to Profile
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
              break;
          }
        },
      ),
    );
  }

  Widget _buildBaton(
    String label,
    double value,
    double maxValue,
    double screenWidth,
  ) {
    final double barHeight = (value / maxValue) * 200;

    return Column(
      children: [
        Container(
          width: screenWidth * 0.15,
          height: barHeight,
          color: primaryColor,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
