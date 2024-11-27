import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecotrack_lite/screens/step2.dart';

class FoodHabits extends StatefulWidget {
  const FoodHabits({super.key});

  @override
  State<FoodHabits> createState() => _FoodHabitsState();
}

class _FoodHabitsState extends State<FoodHabits> {
  static const Color primarycolor = Color(0xff34A353);
  String? _selectedDiet;

  @override
  Widget build(BuildContext context) {
    // Get the screen height for dynamic spacing
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: SingleChildScrollView(
            // Scrollable content for smaller screens
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ), //Dynamic top padding

                //Heading: Step 1
                Text(
                  'Step 1: Food Habits',
                  style: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
                      color: primarycolor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                    height: screenHeight * 0.03), // dynamic space after heading

                // Question
                Text(
                  'What type of diet do you follow?',
                  style: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                    height: screenHeight *
                        0.03), //dynamic space before radion buttons

                // Radio Buttons
                _buildRadioOption(
                  title: 'Plant-based',
                  description: '(Vegetarian/Vegan)',
                  value: 'Plant-based',
                ),
                _buildRadioOption(
                  title: 'Mostly Plant-based',
                  description: '(Plant-based with occasional meat)',
                  value: 'Mostly Plant-based',
                ),
                _buildRadioOption(
                  title: 'Mixed Diet',
                  description: '(Balanced between plant-based and meat)',
                  value: 'Mixed Diet',
                ),
                _buildRadioOption(
                  title: 'Meat-heavy',
                  description: '(Daily consumption of meat and dairy)',
                  value: 'Meat-heavy',
                ),

                SizedBox(height: screenHeight * 0.04),

                RichText(
                  text: TextSpan(
                    text: 'Purpose: ',
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                        color: primarycolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Diet is a key factor in individual carbon footprints, '
                            'especially meat consumption.',
                        style: GoogleFonts.dmSans(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.1),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Transport()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primarycolor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 19,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize
                          .min, // Ensures button wraps around content
                      children: [
                        Text(
                          'Next',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 8), // Spacing between text and icon
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption({
    required String title,
    required String description,
    required String value,
  }) {
    return RadioListTile<String>(
      value: value,
      groupValue: _selectedDiet,
      onChanged: (newValue) {
        setState(() {
          _selectedDiet = newValue!;
        });
      },
      title: Text.rich(
        TextSpan(
          text: '$title ',
          style: GoogleFonts.dmSans(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            TextSpan(
              text: description,
              style: GoogleFonts.dmSans(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      activeColor: primarycolor,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
