import 'package:flutter/material.dart';

class Brakes extends StatefulWidget {
  _BrakesState createState() => _BrakesState();
}

class _BrakesState extends State<Brakes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brakes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Basic Service
            buildServiceCard(
              title: 'Standard Brake Service',
              description: [
                ' Check of brake pads and fluid.',
                ' Standard brake pads.',
                ' Check and refill brake fluid.',
                ' 1 Month warranty'
              ],
              price: 'Est:1,000 EGP',
              imageUrl: 'assets/images/brake.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Standard Service
            buildServiceCard(
              title: 'Enhanced Brake Service',
              description: [
                ' Everything in Standard Service',
                ' Brake pad replacement (if necessary)',
                ' Brake fluid top-up and quality assessment',
                ' Rotor resurfacing (if applicable)',
                ' 3 Months warranty'
              ],
              price: 'Est: 3,000 EGP',
              imageUrl: 'assets/images/brake-blue.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'Premium Brake Service',
              description: [
                ' Everything in Advanced Service',
                ' Complete brake fluid flush and replacement',
                ' Brake pad and rotor replacement (if needed)',
                ' Caliper inspection and cleaning',
                ' Advanced diagnostics for ABS (Anti-lock Braking System)',
                ' 6 Months warranty'
              ],
              price: ' Est: 5000 EGP',
              imageUrl: 'assets/images/brake-gold.png',
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
