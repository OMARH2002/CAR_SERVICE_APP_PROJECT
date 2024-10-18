import 'package:flutter/material.dart';

class Windsheild extends StatefulWidget {
  _WindsheildState createState() => _WindsheildState();
}
class _WindsheildState extends State<Windsheild>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Windshield & Lights'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Basic Service
            buildServiceCard(
              title: 'Standard Service',
              description: [
                ' Windshield cleaning (interior and exterior).',
                ' Visual inspection of windshield for chips and cracks.',
                ' Wiper blade inspection and replacement (if needed).',
                'Headlight, taillight, and turn signal check.',
                'Bulb replacement (standard bulbs).',
                ' 1 Month warranty'
              ],
              price: 'Est:1,000 EGP',
              imageUrl: 'assets/images/headlight.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Standard Service
            buildServiceCard(
              title: 'Enhanced Service',
              description: [
                ' Everything in Standard Service.',
                ' Minor windshield chip or crack repair.',
                ' High-quality wiper blade replacement.',
                ' Upgrade to brighter halogen bulbs (if needed).',
                ' 3 Months warranty'
              ],
              price: 'Est: 3,000 EGP',
              imageUrl: 'assets/images/headlight-blue.png',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'Premium Service',
              description: [
                ' Everything in Advanced Service.',
                ' Full wiper system diagnostics and motor check',
                ' LED or Xenon bulb upgrades for headlights and taillights',
                ' Headlight alignment and restoration for optimal brightness',
                ' Advanced lighting diagnostics (including fog lights, high beams, etc.)',
                ' 6 Months warranty'
              ],
              price: ' Est: 5000 EGP',
              imageUrl: 'assets/images/headlight-gold.png',
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