import 'package:flutter/material.dart';

class Exterior extends StatelessWidget {
  const Exterior({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exterior Cleaning'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Basic Service
            buildServiceCard(
              title: 'Standard Cleaning',
              description: [
                ' Exterior hand wash',
                ' Rinse and dry',
                ' Basic tire and rim cleaning',
                ' Exterior window cleaning'
              ],
              price: 'Est:1,000 EGP',
              imageUrl: 'assets/images/car-service.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Standard Service
            buildServiceCard(
              title: 'Enhanced Cleaning',
              description: [
                'Everything in Standard Cleaning',
                'Clay bar treatment to remove surface contaminants',
                'Wax application for added shine and protection',
                'Tire and rim polish',
                'Door jamb cleaning',
              ],
              price: 'Est: 3,000 EGP',
              imageUrl: 'assets/images/car-service-blue.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'Premium Cleaning',
              description: [
                'Everything in Advanced Cleaning',
                'Full paint correction (buffing out minor scratches and swirl marks)',
                'Ceramic coating or sealant for long-term protection',
                'Headlight restoration',
                'Detailed wheel and tire care (including protective coating)',
                'Trim and chrome polishing',
              ],
              price: ' Est: 5000 EGP',
              imageUrl: 'assets/images/car-service-gold.png',
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
