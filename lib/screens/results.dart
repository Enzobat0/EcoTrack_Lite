import 'package:ecotrack_lite/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecotrack_lite/screens/sign_up.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  static const Color primarycolor = Color(0xff34A353);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.8; // Same width for both buttons

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // All Set Heading
                Text(
                  'All set! Let’s see your results!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
                      color: primarycolor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.1), // Spacing after heading

                // Register Button
                SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to Register Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primarycolor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register to see results',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                    height: screenHeight * 0.03), // Spacing between buttons

                // Go Back & Edit Button
                SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to edit
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: primarycolor),
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_back, color: primarycolor),
                        const SizedBox(width: 8),
                        Text(
                          'Go back & Edit',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              color: primarycolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                    height: screenHeight * 0.15), // Spacing before bottom text

                // Already have an account? Login text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Login Screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.dmSans(
                          textStyle: const TextStyle(
                            color: primarycolor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
