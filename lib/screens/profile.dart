import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecotrack_lite/screens/homepage.dart';
import 'package:ecotrack_lite/screens/ecotips.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecotrack_lite/screens/login.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ProfilePage extends StatelessWidget {
  final int _currentIndex = 2; // Set the initial index to 2 for Profile


  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.dmSans(),
        ),
        backgroundColor: const Color(0xff34A353),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: user?.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : const AssetImage('images/profile_placeholder.png')
                        as ImageProvider, 
              ),
            ),
            const SizedBox(height: 20),
            Text(
              user?.displayName ?? 'User Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              user?.email ?? 'user.email@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              'Location: City, Country',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              'Bio:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'A short biography about the user goes here. This can include interests, hobbies, and other relevant information.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Edit Profile page or show dialog
                },
                child: Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff34A353), // Background color
                  foregroundColor: Colors.white, // Text color
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Sign out from Firebase
                  await FirebaseAuth.instance.signOut();

                  // Disconnect Google Sign-In to clear session
                  await googleSignIn.signOut();

                  // Navigate to the Login Screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Logout button color
                  foregroundColor: Colors.white, // Text color
                ),
              ),
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
        currentIndex: _currentIndex, // Set the current index to Profile
        selectedItemColor: const Color(0xff34A353),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation based on the index tapped
          switch (index) {
            case 0:
              // Navigate to Home
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              // Navigate to EcoTips
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => EcoTipsPage()),
              );
              break;
            case 2:
              // Already on Profile, do nothing
              break;
          }
        },
      ),
    );
  }
}
