import 'package:flutter/material.dart';

class Batteries extends StatefulWidget {
  const Batteries({super.key});

  @override
  _BatteriesState createState() => _BatteriesState();
}

class _BatteriesState extends State<Batteries> {
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
          title: const Text('Batteries'),
          actions: [
            if (_isCartVisible)
              Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
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
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 24,
                          minHeight: 24,
                        ),
                        child: Center(
                          child: Text(
                            cart.length.toString(),
                            style: const TextStyle(
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
                  title: 'Chloride Lithium Golf Car Battery',
                  description: [
                    'Battery Ampere: 100 Ampere',
                    'Voltage Capacity: 51.2 Volt',
                    'Battery Length: 560 mm',
                    'Battery Width: 371 mm',
                    'Battery Height: 243.5 mm',
                    'Warranty: 5 Years'
                  ],
                  price: 'Price: 111,500 EGP',
                  imageUrl: 'assets/images/chloride_lithium_golf_car_battery_.jpg',
                  onAdd: () {
                    _addToCart({
                      'title': 'Chloride Lithium Golf Car Battery',
                      'price': '111,500 EGP',
                    });
                  },
                ),
                const SizedBox(height: 10),

                // Standard Service
                buildServiceCard(
                  title: 'ACDelco Car Battery',
                  description: [
                    'Battery Ampere Capacity: 88 Ampere',
                    'Voltage Capacity: 12 Volt',
                    'Positive Terminal: Right',
                    'Warranty: 12 Months From Purchasing Date'
                  ],
                  price: '4,850 EGP',
                  imageUrl: 'assets/images/ACDelco Car Battery.jpg',
                  onAdd: () {
                    _addToCart({
                      'title': 'ACDelco Car Battery',
                      'price': '4,850 EGP',
                    });
                  },
                ),
                const SizedBox(height: 10),

                // Comprehensive Service
                buildServiceCard(
                  title: 'Bosch Car Battery',
                  description: [
                    'Battery Ampere Capacity: 60 Ampere',
                    'Voltage Capacity: 12 Volt',
                    'Positive Terminal: Right',
                    'Warranty: 12 Months From Purchasing Date'
                  ],
                  price: '3,900 EGP',
                  imageUrl: 'assets/images/bosch_car_battery.jpg',
                  onAdd: () {
                    _addToCart({
                      'title': 'Bosch Car Battery',
                      'price': '3,900 EGP',
                    });

                  },
                ),
                const SizedBox(height: 10),

                // Comprehensive Service
                buildServiceCard(
                    title: 'Chloride EFB Car Battery',
                    description: [
                      'Battery Ampere Capacity: 70 Ampere',
                      'Voltage Capacity: 12 Volt',
                      'Positive Terminal: Right',
                      'Warranty: 2 Years From Purchase Date'
                    ],
                    price: '7,349 EGP',
                    imageUrl: 'assets/images/chloride_efb_car_battery.jpg',
                    onAdd: () {
                      _addToCart({
                        'title': 'Chloride EFB Car Battery',
                        'price': '7,349 EGP',
                      });
                    }),
                const SizedBox(height: 10),

                // Comprehensive Service
                buildServiceCard(
                    title: 'Chloride Platinum Car Battery',
                    description: [
                      'Battery Ampere Capacity: 70 Ampere',
                      'Voltage Capacity: 12 Volt',
                      'Positive Terminal: Right',
                      'Cold cranking Ampere: 720',
                      'Reserve Capacity: 120',
                      'Battery Length: 276mm',
                     'Battery Width: 175mm',
                      'Battery Height: 190.4mm',
                      'Warranty:2 Years From Purchase Date'
                    ],
                    price: '5,210 EGP',
                    imageUrl: 'assets/images/chloride_platinum_car_battery.jpg',
                    onAdd: () {
                      _addToCart({
                        'title': 'Chloride Platinum Car Battery',
                        'price': '5,210 EGP',
                      });
                    }),
                const SizedBox(height: 10),

                // Comprehensive Service
                buildServiceCard(
                    title: 'Chloride Gold Car Battery',
                    description: [
                      'Battery Ampere Capacity: 150 Ampere',
                      'Voltage Capacity: 12 Volt',
                      'Warranty: 6 Months from Purchase Date',
                    ],
                    price: '7,100 EGP',
                    imageUrl: 'assets/images/Chloride Gold Car Battery.png',
                    onAdd: () {
                      _addToCart({
                        'title': 'Chloride Gold Car Battery',
                        'price': '7,100 EGP',
                      });
                    }),
                const SizedBox(height: 10),

                // Comprehensive Service
                buildServiceCard(
                    title: 'ACDelco Car Battery',
                    description: [
                      'Battery Ampere Capacity: 35 Ampere',
                      'Voltage Capacity: 12 Volt',
                      'Warranty: 12 Months From Purchasing Date',
                    ],
                    price: '2,825 EGP',
                    imageUrl: 'assets/images/ACDelco Car Battery2.jpg',
                    onAdd: () {
                      _addToCart({
                        'title': 'ACDelco Car Battery',
                        'price': '2,825 EGP',
                      });
                    }),
                const SizedBox(height: 10),

                // Comprehensive Service
                buildServiceCard(
                    title: 'Bosch Car Battery',
                    description: [
                      'Battery Ampere Capacity: 70 Ampere',
                     'Voltage Capacity: 12 Volt',
                      'Cold cranking Ampere: 760',
                      'Warranty: 18 Months From Purchasing Date'
                    ],
                    price: '11,636 EGP',
                    imageUrl: 'assets/images/bosch_car_battery_agm.jpg',
                    onAdd: () {
                      _addToCart({
                        'title': 'Bosch Car Battery',
                        'price': '11,636 EGP',
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: description
                        .map((desc) => Text('• $desc'))
                        .toList(),
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

            // Image and ADD Button
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
                  child: const Text('Add to cart', style: TextStyle(color: Colors.black)),
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
        return SizedBox(
          height: 400, // Set a fixed height for the BottomSheet
          child: Column(
            children: [
              ListTile(
                title: const Text('Shopping Cart', style: TextStyle(fontSize: 24)),
                trailing: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ),
              const Divider(),
              Expanded( // Make the cart content scrollable
                child: cart.isEmpty
                    ? const Center(child: Text('Your cart is empty'))
                    : SingleChildScrollView(
                  child: Column(
                    children: List.generate(cart.length, (index) {
                      final service = cart[index];
                      return ListTile(
                        title: Text(service['title']!),
                        subtitle: Text(service['price']!),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
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
                        padding: const EdgeInsets.all(16), // Larger touch target
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded button
                        ),
                        backgroundColor: Colors.green, // Green checkout button
                      ),
                      child: const Text(
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
