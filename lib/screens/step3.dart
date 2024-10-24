import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecotrack_lite/screens/step4.dart';

class FuelEnergy extends StatefulWidget {
  const FuelEnergy({super.key});

  @override
  State<FuelEnergy> createState() => _FuelEnergyState();
}

class _FuelEnergyState extends State<FuelEnergy> {
  static const Color primarycolor = Color(0xff34A353);
  String? _selectedEnergy;

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
                  'Step 3: Fuel & Energy Use ',
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
                  'What kind of energy do you use at home?',
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

                
                // Energy Source Radio Buttons
                _buildEnergyOption('Electricity'),
                _buildEnergyOption('Solar Panels'),
                _buildEnergyOption('Natural Gas'),

                SizedBox(height: screenHeight * 0.1), // Spacing before purpose

                // Purpose Section
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
                            'Energy usage impacts home carbon emissions, and knowing '
                            'the source helps with more accurate footprint estimates.',
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

// Navigation buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Previous button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                            context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: primarycolor),
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
                        const Icon(
                          Icons.arrow_left,
                          color: primarycolor,
                        ),

                        const SizedBox(
                            width: 8), 

                        Text(
                          'Previous',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              color: primarycolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Spacing between text and icon
                      
                      ],
                      ),
                    ),

                    // Next button
                    ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FuelEnergy()));
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
                          Icons.arrow_right_alt_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper to build energy radio options
  Widget _buildEnergyOption(String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: _selectedEnergy,
      onChanged: (newValue) {
        setState(() {
          _selectedEnergy = newValue;
        });
      },
      title: Text(
        value,
        style: GoogleFonts.dmSans(
          textStyle: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      activeColor: primarycolor,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
