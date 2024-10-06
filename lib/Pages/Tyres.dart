import 'package:depci_grad_project/Pages/Checkout_one.dart';
import 'package:flutter/material.dart';

class Tyres extends StatefulWidget {
  @override
  _TyresState createState() => _TyresState();
}

class _TyresState extends State<Tyres> {
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
        title: Text('Tyres and Wheel Care'),
        actions: [
          if (_isCartVisible)
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 39,
                  ),
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
              title: 'All Season Tyre',
              description: [
                '205/55 R16',
                'Versatile option for moderate climates',
                '30,000 Km Warranty'
              ],
              price: '10,000 EGP Per Wheel',
              imageUrl: 'assets/images/205-55 R16.jpg',
              onAdd: () {
                _addToCart({
                  'title': '205/55 R16',
                  'price': '10,000 EGP',
                });
              },
            ),
            SizedBox(height: 10),

            // Standard Service
            buildServiceCard(
              title: 'All Season Tyre',
              description: [
                '225/60 R17',
                ' Great balance between comfort and performance',
                '40,000 Km Warranty',
              ],
              price: '9500 EGP Per Wheel',
              imageUrl: 'assets/images/205-55 R16.jpg',
              onAdd: () {
                _addToCart({
                  'title': '225/60 R17',
                  'price': '9000 EGP',
                });
              },
            ),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
              title: 'Winter Tyre',
              description: [
                '195/65R15',
                ' Ideal for compact cars in snowy condition',
                '35,000 KM Warranty',
              ],
              price: '7000 EGP Per Wheel',
              imageUrl: 'assets/images/195-65R15.jpg',
              onAdd: () {
                _addToCart({
                  'title': '195/65R15',
                  'price': '7000 EGP',
                });

              },
            ),
             SizedBox(height: 10),

    // Comprehensive Service
          buildServiceCard(
          title: 'Winter Tyre',
          description: [
          '215/70R16',
          'Suitable for SUVs and light trucks',
          '35,000 KM Warranty',
          ],
          price: '8500 EGP Per Wheel',
          imageUrl: 'assets/images/215-70R16.png',
          onAdd: () {
            _addToCart({
              'title': '215/70R16',
              'price': '8500 EGP',
            });
          }),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
                title: 'Summer Tyre',
                description: [
                  '245/45R18',
                  'High-performance tyre for sport cars',
                  '60,000 KM Warranty',
                ],
                price: '12,500 EGP Per Wheel',
                imageUrl: 'assets/images/245-45R18.jpg',
                onAdd: () {
                  _addToCart({
                    'title': '245/45R18',
                    'price': '12,500 EGP',
                  });
                }),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
                title: 'Summer Tyre',
                description: [
                  '225/50R17',
                  'Offers excellent handling and braking',
                  '60,000 KM Warranty',
                ],
                price: '10,500 EGP Per Wheel',
                imageUrl: 'assets/images/225-50R17.png',
                onAdd: () {
                  _addToCart({
                    'title': '225/50R17',
                    'price': '10,500 EGP',
                  });
                }),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
                title: 'Performance Tyre',
                description: [
                  '275/30R20',
                  'Designed for supercars with enhanced grip',
                  '40,000 KM Warranty',
                ],
                price: '18,000 EGP Per Wheel',
                imageUrl: 'assets/images/275-30R20.png',
                onAdd: () {
                  _addToCart({
                    'title': '275/30R20',
                    'price': '18,000 EGP',
                  });
                }),
            SizedBox(height: 10),

            // Comprehensive Service
            buildServiceCard(
                title: 'Performance Tyre',
                description: [
                  '245/35R19',
                  'Great for luxury vehicles aiming for sporty performance',
                  '50,000 KM Warranty',
                ],
                price: '25,000 EGP Per Wheel',
                imageUrl: 'assets/images/245-35R19.png',
                onAdd: () {
                  _addToCart({
                    'title': '245/35R19',
                    'price': '25,000 EGP',
                  });
                }),
     ] ),

      ) );
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
                  child: Text('Add to cart', style: TextStyle(color: Colors.black)),
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

              // Checkout Button (only visible when there are items in the cart)
              if (cart.isNotEmpty) // Check if cart is not empty
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity, // Full-width button
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle checkout action here
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/CheckoutOne');// Close the bottom sheet
                        // Navigate to checkout page or perform another action
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16), // Larger touch target
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded button
                        ),
                        backgroundColor: Colors.green, // Green checkout button
                      ),
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
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
