import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: SingleChildScrollView( // Scrollable content for smaller screens
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
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
                const SizedBox(height: 25),
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
                const SizedBox(height: 30),
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
                const SizedBox(height: 30),
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
                const SizedBox(height: 75),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    label: Text(
                      'Next',
                      style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_right_alt_sharp,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primarycolor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
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
