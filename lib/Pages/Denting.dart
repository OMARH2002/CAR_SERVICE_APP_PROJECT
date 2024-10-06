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
              title: 'Basic Service',
              description: [
                'Every 5000 Kms/3 Months',
                'Takes 4 Hours',
                '1 Month Warranty',
                'Includes 9 Services',
              ],
              price: ' Est: 3000 EGP',
              imageUrl: 'assets/images/Basic_Service.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Standard Service
            buildServiceCard(
              title: 'Standard Service',
              description: [
                'Every 10000 Kms/6 Months',
                'Takes 6 Hours',
                '1 Month Warranty',
                'Includes 15 Services',
              ],
              price: ' Est: 7000 EGP',
              imageUrl: 'assets/images/Standard_Service.jpg',
              onAdd: () {
                Navigator.pushNamed(context, '/bookingform');
              },
            ),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'Comprehensive Service',
              description: [
                'Every 20000 Kms/1 Year',
                'Takes 8 Hours',
                '1 Month Warranty',
                'Includes 20 Services',
              ],
              price: ' Est: 15000 EGP',
              imageUrl: 'assets/images/Comprehensive _service.jpg',
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

