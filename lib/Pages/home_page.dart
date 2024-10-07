import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _allServices = [
    {'image': 'assets/images/Car_Service.png', 'label': 'Car Service', 'route': '/CarService'},
    {'image': 'assets/images/Tyre_Care.png', 'label': 'Tyres & Wheel Care', 'route': '/Tyres'},
    {'image': 'assets/images/Car_Denting.png', 'label': 'Denting & Painting', 'route': '/Denting'},
    {'image': 'assets/images/AC_Car.png', 'label': 'AC Service & Repair', 'route': '/AC'},
    {'image': 'assets/images/Interior_Cleaning.png', 'label': 'Interior Cleaning', 'route': '/Interior'},
    {'image': 'assets/images/Car_Battery.png', 'label': 'Batteries', 'route': '/Batteries'},
    {'image': 'assets/images/Insurance.png', 'label': 'Insurance Claims', 'route': '/Insurance'},
    {'image': 'assets/images/Windsheild.png', 'label': 'Windshield & Lights', 'route': '/Windsheild'},
    {'image': 'assets/images/Brakes.png', 'label': 'Clutch & Brakes', 'route': '/Brakes'},
    {'image': 'assets/images/Exterior_clean.png', 'label': 'Exterior clean', 'route': '/Exterior'},
    {'image': 'assets/images/Auto_Clean.png', 'label': 'Auto Car Wash', 'route': '/AutoCarWash'},
    {'image': 'assets/images/Oil_Change.png', 'label': 'Oil Products', 'route': '/Oiling'},
  ];

  List<Map<String, dynamic>> _filteredServices = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredServices = _allServices;
  }

  void _filterServices(String query) {
    final filtered = _allServices.where((service) {
      final labelLower = service['label'].toLowerCase();
      final queryLower = query.toLowerCase();
      return labelLower.contains(queryLower);
    }).toList();

    setState(() {
      _filteredServices = filtered;
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User greeting and location
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Steve ', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(Icons.location_on_sharp, size: 16, color: Colors.grey),
                          Text('Alexandria, Egypt', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    child: GestureDetector(
                      child: Image.asset('assets/images/person.png'),
                      onTap: () {
                        Navigator.pushNamed(context, '/ProfileScreen');
                      },
                    ),
                    radius: 30,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Search bar
              TextField(
                onChanged: _filterServices,
                decoration: InputDecoration(
                  hintText: 'Search for a service',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text('Select Service', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 7),

              // GridView for services
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredServices.length,
                itemBuilder: (context, index) {
                  final service = _filteredServices[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Image.asset(service['image'], scale: 10),
                        onTap: () {
                          Navigator.pushNamed(context, service['route']);
                        },
                      ),
                      const SizedBox(height: 5),
                      Text(
                        service['label'],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.purple),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
