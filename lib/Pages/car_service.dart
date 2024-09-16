import 'package:flutter/material.dart';

class CarService extends StatefulWidget {
  @override
  _CarServiceState createState() => _CarServiceState();
}

class _CarServiceState extends State<CarService> {
  List<Map<String, String>> cart = [];
  bool _isCartVisible = false;

  void _addToCart(Map<String, String> service) {
    setState(() {
      cart.add(service);
      _isCartVisible = true; // Show cart when an item is added
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      cart.removeAt(index);
      if (cart.isEmpty) {
        _isCartVisible = false; // Hide cart if no items are left
      }
    });
    _refreshCart(context); // Refresh the cart when an item is removed
  }

  void _refreshCart(BuildContext context) {
    Navigator.pop(context); // Close the current BottomSheet
    _showCart(context); // Reopen the BottomSheet with updated cart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Services'),
        actions: [
          if (_isCartVisible)
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart,size: 39,),
                  onPressed: () {
                    _showCart(context);
                  },
                ),
                if (cart.isNotEmpty)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                      child: Center(
                        child: Text(
                          cart.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
        ],
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
              price: '3000 EGP',
              imageUrl: 'assets/images/Basic_Service.jpg',
              onAdd: () {
                _addToCart({
                  'title': 'Basic Service',
                  'price': '3000 EGP',
                });
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
              price: '7000 EGP',
              imageUrl: 'assets/images/Standard_Service.jpg',
              onAdd: () {
                _addToCart({
                  'title': 'Standard Service',
                  'price': '7000 EGP',
                });
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
              price: '15000 EGP',
              imageUrl: 'assets/images/Comprehensive _service.jpg',
              onAdd: () {
                _addToCart({
                  'title': 'Comprehensive Service',
                  'price': '15000 EGP',
                });
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

            // Image and ADD Button
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
                  child: Text('ADD', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Show cart as a modal bottom sheet
  void _showCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return Container(
          height: 400, // Set a fixed height for the BottomSheet
          child: Column(
            children: [
              ListTile(
                title: Text('Shopping Cart', style: TextStyle(fontSize: 24)),
                trailing: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ),
              Divider(),
              Expanded( // Make the cart content scrollable
                child: cart.isEmpty
                    ? Center(child: Text('Your cart is empty'))
                    : SingleChildScrollView(
                  child: Column(
                    children: List.generate(cart.length, (index) {
                      final service = cart[index];
                      return ListTile(
                        title: Text(service['title']!),
                        subtitle: Text(service['price']!),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _removeFromCart(index);
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
