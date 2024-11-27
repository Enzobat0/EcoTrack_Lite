import 'package:flutter/material.dart';
import 'package:ecotrack_lite/screens/step1.dart';
import 'package:ecotrack_lite/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});
  static const Color buttoncolor = Color(0xff34A353);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Image(image: AssetImage('images/logo-white.png')),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FoodHabits()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttoncolor,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 22),
                textStyle: GoogleFonts.dmSans(
                  textStyle: const TextStyle(
                    fontSize: 26,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Footprint Calculator'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.dmSans(
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              child: const Text('Already a member? Login'),
            )
          ],
        ),
      ),
    );
  }
}
