import 'package:flutter/material.dart';

class OilChange extends StatelessWidget {
  const OilChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oil Change'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Basic Service
            buildServiceCard(
              title: 'Conventional Motor Oil',
              description: [
                ' Provides basic engine lubrication',
                ' Requires more frequent changes',
                ' Suitable for normal driving conditions'
              ],
              price: 'Est:50 EGP',
              imageUrl: 'assets/images/engine-oil.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Standard Service
            buildServiceCard(
              title: 'Full Synthetic Motor Oil',
              description: [
                ' Handles extreme temperatures and high-stress conditions',
                ' Longer oil change intervals',
                ' Ideal for modern and high-performance vehicles'
              ],
              price: 'Est: 100 EGP',
              imageUrl: 'assets/images/engine-oil-blue.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'High-Mileage Motor Oil',
              description: [
                ' Reduces oil consumption and engine wear',
                ' Helps prevent leaks and protects aging engines',
              ],
              price: ' Est: 200 EGP',
              imageUrl: 'assets/images/engine-oil-green.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            buildServiceCard(
              title: 'Synthetic Blend Motor Oil',
              description: [
                ' Provides better protection than conventional oil',
                ' Ideal for vehicles driven in moderate conditions',
              ],
              price: ' Est: 200 EGP',
              imageUrl: 'assets/images/engine-oil-gold.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
          ],
        ),
      ),
    );
  }

// Helper method to build each service card
  Widget buildServiceCard({
    required String title,
    required List<String> description,
    required String price,
    required String imageUrl,
    required VoidCallback onAdd,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Description (Expanded to avoid overflow)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        description.map((desc) => Text('• $desc')).toList(),
                  ),
                  SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            // Image and book Button
            SizedBox(width: 16), // Add some space between text and image
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onAdd,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Book', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
