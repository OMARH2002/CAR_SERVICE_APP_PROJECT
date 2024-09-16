import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Track which tab is selected
  int _selectedIndex = 0;

  // Store services in cart
  Map<String, int> _cart = {};

  // List of pages to display for each tab
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    // Initialize _pages with the cart
    _pages.addAll([
      ServiceListScreen(onAddToCart: _addToCart), // Your service list screen with cart functionality
      VehiclesScreen(),    // Placeholder for the Vehicles screen
           // Placeholder for the Records screen
    ]);
  }

  // Handle tap on navigation bar items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Add services to the cart
  void _addToCart(String serviceName) {
    setState(() {
      if (_cart.containsKey(serviceName)) {
        _cart[serviceName] = _cart[serviceName]! + 1;
      } else {
        _cart[serviceName] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Service App'),
        centerTitle: true,
        actions: [
          // Display cart icon with total items count
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (_cart.isNotEmpty)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${_cart.values.fold<int>(0, (sum, qty) => sum + qty)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
              ],
            ),
            onPressed: () {
              // Navigate to cart or display cart details
              _showCartDetails(context);
            },
          )
        ],
      ),
      body: _pages[_selectedIndex], // Display page based on selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // This determines which tab is selected
        onTap: _onItemTapped, // This updates the selected index
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Vehicles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Records',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Show cart details in a dialog
  void _showCartDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cart'),
          content: SingleChildScrollView(
            child: ListBody(
              children: _cart.entries.map((entry) {
                return Text('${entry.key}: ${entry.value}');
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// Service screen that shows service cards
class ServiceListScreen extends StatelessWidget {
  final Function(String) onAddToCart;

  ServiceListScreen({required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            price: 'Rs. 2,599',
            imageUrl: 'assets/images/Standard_Service.jpg', // Replace with actual image path
            onAddToCart: onAddToCart,
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
            price: 'Rs. 3,799',
            imageUrl: 'assets/standard_service.jpg', // Replace with actual image path
            onAddToCart: onAddToCart,
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
            price: 'Rs. 5,699',
            imageUrl: 'assets/comprehensive_service.jpg', // Replace with actual image path
            onAddToCart: onAddToCart,
          ),
        ],
      ),
    );
  }

  // Helper function to create each service card
  Widget buildServiceCard({
    required String title,
    required List<String> description,
    required String price,
    required String imageUrl,
    required Function(String) onAddToCart,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Service Description
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
            SizedBox(width: 16), // Space between text and image
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
                  onPressed: () {
                    onAddToCart(title);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('ADD'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy Vehicles screen
class VehiclesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Vehicles Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Dummy Records screen

