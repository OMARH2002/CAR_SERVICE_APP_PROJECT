import 'package:flutter/material.dart';

class Denting extends StatefulWidget {
  @override
  _DentingState createState() => _DentingState();
}

class _DentingState extends State<Denting> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Denting & Painting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Basic Service
            buildServiceCard(
              title: 'Minor Dent Repair',
              description: [
                'Fix small dents without affecting the car’s paint.',
                'Takes 1-2 Hours',
                'Price depending on size of dent and location'
              ],
              price: 'Est: 1500-4000 EGP  ',
              imageUrl: 'assets/images/minor dent.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Standard Service
            buildServiceCard(
              title: 'Full Body Repainting',
              description: [
                ' Restore your car"s original color or change it entirely',
                    'professional full-body repainting.',
                'Takes 3-5 Days',
                'Price depending on car size and paint type',
              ],
              price: 'Est: 40,000-100,000 EGP',
              imageUrl: 'assets/images/Full Body Repainting.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'Scratch and Paint Touch-Up',
              description: [
                ' Repair scratches with precision touch-up paint that matches your car’s original color.',
                'Takes 1-3 Hours',
              ],
              price: 'Est: 1500 EGP',
              imageUrl: 'assets/images/car scratch.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
              SizedBox(height: 10),

              // Comprehensive Service
              buildServiceCard(
              title: 'Panel Replacement and Painting',
              description: [
              ' Replace damaged parts and repaint them to match your car’s color.',
              'Takes 1-2 Days',
              'Price includes parts and labor',
              ],
              price: 'Est: 9,000-24,000 EGP ',
              imageUrl: 'assets/images/Panel Replacement and Painting.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              }),
              SizedBox(height: 10),

              // Comprehensive Service
              buildServiceCard(
              title: ' Rust Treatment and Repainting',
              description: [
              'Treat rust-affected areas with anti-rust coating '
                  'and repaint to restore the look and prevent further damage.',
              'Takes 1-2 Days',
              'Price depends on the affected area',
              ],
              price: 'Est:4,500-15,000 EGP',
              imageUrl: 'assets/images/Comprehensive _service.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              })],
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
                    children: description
                        .map((desc) => Text('• $desc'))
                        .toList(),
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

