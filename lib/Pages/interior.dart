import 'package:depci_grad_project/Pages/Checkout_one.dart';
import 'package:flutter/material.dart';

class Interior extends StatefulWidget {
  @override
  _InteriorState createState() => _InteriorState();
}

class _InteriorState extends State<Interior> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interior Cleaning'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Basic Service
            buildServiceCard(
              title: 'Basic Interior Cleaning',
              description: [
                'A  cleaning of the car interior,'
                 ' including vacuuming carpets, cleaning seats, wiping down surfaces, and polishing the dashboard.',
                'Service Duration: 1-2 hours',
              ],
              price: 'Est: 500 - 1,500 EGP',
              imageUrl: 'assets/images/Basic Interior Cleaning.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Standard Service
            buildServiceCard(
              title: 'Deep Interior Cleaning',
              description: [
                'Intensive cleaning service includes cleaning of seats and carpets, stain removal, and cleaning hard-to-reach areas.',
                'Service Duration: 2-4 hours',
              ],
              price: 'Est: 1,500 - 3,500 EGP',
              imageUrl: 'assets/images/Deep Interior Cleaning.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'Leather Seat Cleaning',
              description: [
                'Special care for leather seats, gentle cleaning  to restore the leather’s natural look and prevent cracking.',

                'Service Duration: 1-2 hours',
              ],
              price: 'Est: 1,000 - 2,500 EGP',
              imageUrl: 'assets/images/Leather Seat Cleaning.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),

            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'Odor Removal Treatment',
              description: [
                ' Eliminates unpleasant odors using specialized cleaning agents',
                'Service Duration: 1-2 hours.',
              ],
              price: 'Est: 500 - 1,500 EGP',
              imageUrl: 'assets/images/Odor Removal Treatment.jpg',
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

