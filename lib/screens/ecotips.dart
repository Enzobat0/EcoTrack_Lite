import 'package:ecotrack_lite/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecotrack_lite/screens/homepage.dart'; 

class EcoTipsPage extends StatefulWidget {
  @override
  _EcoTipsPageState createState() => _EcoTipsPageState();
}

class _EcoTipsPageState extends State<EcoTipsPage> {
  int _currentIndex = 1; // Set the initial index to 1 for EcoTips

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eco Tips',
          style: GoogleFonts.dmSans(),
        ),
        backgroundColor: const Color(0xff34A353),
      ),
      body: SingleChildScrollView( // Wrap the content in SingleChildScrollView
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Learn how to reduce your carbon footprint with these eco-friendly tips:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            _buildTip(
              '1. Reduce, Reuse, Recycle',
              'Minimize waste by recycling materials and reusing items whenever possible. '
              'This helps conserve resources and reduce pollution.',
            ),
            const SizedBox(height: 15),
            _buildTip(
              '2. Use Energy-Efficient Appliances',
              'Opt for appliances that consume less energy. '
              'They not only reduce your energy bill but also help decrease your carbon footprint.',
            ),
            const SizedBox(height: 15),
            _buildTip(
              '3. Conserve Water',
              'Simple actions like fixing leaks, taking shorter showers, and turning off the tap while brushing can save a significant amount of water.',
            ),
            const SizedBox(height: 15),
            _buildTip(
              '4. Choose Sustainable Transportation',
              'Whenever possible, walk, bike, or use public transport. '
              'This reduces greenhouse gas emissions and helps keep our air clean.',
            ),
            const SizedBox(height: 15),
            _buildTip(
              '5. Support Local Farmers',
              'Buying locally grown food reduces the carbon footprint associated with transporting goods over long distances.',
            ),
            const SizedBox(height: 20),
            const Text(
              'By adopting these eco-friendly practices, you can contribute to a healthier planet. Every little bit helps!',
              style: TextStyle(fontSize: 16),
            ),
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
        currentIndex: _currentIndex, // Set the current index to EcoTips
        selectedItemColor: const Color(0xff34A353),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });

          // Navigate based on the selected index
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              // Already on EcoTips, do nothing
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()), // Adjust to your Profile page
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildTip(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
