import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EcoTipsScreen extends StatelessWidget {
  final List<String> ecoTips = [
    "Reduce, Reuse, Recycle",
    "Use energy-efficient appliances",
    "Switch to renewable energy sources",
    "Walk, bike, or use public transport",
    "Plant trees and support reforestation",
    "Reduce meat consumption",
    "Conserve water",
    "Choose sustainable products",
    "Educate others about climate change",
    "Support local businesses"
  ];

  const EcoTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco Tips'),
        backgroundColor: Colors.green, // Optional: Set AppBar color to green
      ),
      body: Container(
        color: Colors.white, // Background color of the screen
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: ecoTips.length,
          itemBuilder: (BuildContext context, int index) => Card(
            color: Colors.black, // Background color of the card
            elevation: 4,
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ecoTips[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Text color set to green
                ),
              ),
            ),
          ),
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
      ),
    );
  }
}
