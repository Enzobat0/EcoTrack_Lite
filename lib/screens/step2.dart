import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecotrack_lite/screens/step3.dart';

class Transport extends StatefulWidget {
  const Transport({super.key});

  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  static const Color primarycolor = Color(0xff34A353);
  String? _selectedTransport;
  String? _selectedKm;

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

                //Heading: Step 2
                Text(
                  'Step 2: Transport',
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
                  'How do you usually get around?',
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

                // Radio Buttons for Transport Types
                _buildTransportOption('Car (gasoline, hybrid, or electric)'),
                _buildTransportOption('Public transport (bus, train, subway)'),
                _buildTransportOption('Bike/Walk'),

                // Show follow-up question only if 'Car' is selected
                if (_selectedTransport == 'Car (gasoline, hybrid, or electric)')
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Follow-up question: Kilometers driven
                        Text(
                          'How many kilometers do you drive/ride?',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // Follow-up radio buttons for kilometers
                        _buildKilometersOption('Less than 10 km/day'),
                        _buildKilometersOption('10-30 km/day'),
                        _buildKilometersOption('30-50 km/day'),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.1),
                  
                  // Purpose

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

                //  Navigation Buttons

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
                        side: const BorderSide(color: primarycolor),
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
                          Icons.arrow_back,
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
                          MaterialPageRoute(builder: (context) => const FuelEnergy()));
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper to build transport radio options
  Widget _buildTransportOption(String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: _selectedTransport,
      onChanged: (newValue) {
        setState(() {
          _selectedTransport = newValue;
          if (newValue != 'Car (gasoline, hybrid, or electric)') {
            _selectedKm = null; // Reset kilometers selection
          }
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

// Helper to build kilometer radio options
  Widget _buildKilometersOption(String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: _selectedKm,
      onChanged: (newValue) {
        setState(() {
          _selectedKm = newValue;
        });
      },
      title: Text(
        value,
        style: GoogleFonts.dmSans(
          textStyle: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      activeColor: primarycolor,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
