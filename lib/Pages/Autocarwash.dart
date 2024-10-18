import 'package:flutter/material.dart';

class AutoCarWash extends StatelessWidget {
  const AutoCarWash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Car Wash'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Basic Service
            buildServiceCard(
              title: 'Standard Service',
              description: [
                ' Exterior machine wash with soap and water',
                ' Soft-touch or touchless wash',
                ' Rinse and air dry',
                ' Basic tire and wheel wash',
              ],
              price: 'Est:500 EGP',
              imageUrl: 'assets/images/Standard Service.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            const SizedBox(height: 10),

            // Standard Service
            buildServiceCard(
              title: 'Enhanced Service',
              description: [
                ' Everything in Standard Car wash',
                ' Underbody wash to remove dirt and salt',
                ' Triple-foam wax for added shine and protection',
                ' Tire shine application',
                ' Spot-free rinse for a streak-free finish'
              ],
              price: 'Est: 850 EGP',
              imageUrl: 'assets/images/Enhanced Service.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            const SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'Premium Service',
              description: [
                ' Everything in Enhanced Car wash',
                ' Clear coat protectant for long-lasting shine',
                ' Rain repellent treatment for windows and windshield',
                ' Wheel and rim polish',
                ' Interior vacuum and wipe down (after leaving the machine)',
                ' Detailing Touches',
              ],
              price: ' Est: 1500 EGP',
              imageUrl: 'assets/images/Premium Service.jpg',
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    description.map((desc) => Text('• $desc')).toList(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            // Image and book Button
            const SizedBox(width: 16), // Add some space between text and image
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
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onAdd,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Book', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}