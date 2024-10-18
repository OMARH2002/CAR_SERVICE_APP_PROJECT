import 'package:flutter/material.dart';

class Insurance extends StatefulWidget {
  _InsuranceState createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insurance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Basic Service
            buildServiceCard(
              title: 'Standard Coverage',
              description: [
                ' 3 Months coverage',
                ' Covers bodily injury and property damage to others.',
                ' Basic services like towing and fuel delivery.',
                ' Online claim submission and tracking',
              ],
              price: 'Starts from : 3,000 EGP',
              imageUrl: 'assets/images/protection.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Standard Service
            buildServiceCard(
              title: 'Advanced Coverage',
              description: [
                ' 6 Months coverage',
                ' Includes everything from Standard insurance',
                ' Covers theft, vandalism, and natural disasters.',
                ' Provides reimbursement for rental cars while your car is being repaired.',
                ' Access to a dedicated claims representative for assistance.'
              ],
              price: 'Starts from : 5000 EGP',
              imageUrl: 'assets/images/protection-blue.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'Premium Coverage',
              description: [
                ' 12 Months coverage',
                ' Includes everything from Advanced insurance',
                ' Covers damages from collisions with other vehicles or objects.',
                ' Provides financial support in case of severe accidents.',
                ' Covers medical expenses for you and your passengers, regardless of fault.',
                ' Faster claims approval and priority service for repairs.',
              ],
              price: ' Starts from : 9000 EGP',
              imageUrl: 'assets/images/protection-gold.png',
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
                    backgroundColor: Colors.lightBlue,
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