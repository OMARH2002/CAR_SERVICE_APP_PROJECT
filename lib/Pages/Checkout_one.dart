import 'package:flutter/material.dart';

class CheckoutScreenOne extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreenOne> {
  String? selectedProvince;
  String? selectedCity;

  final cities = ['Cairo', 'Alexandria', 'Matrouh'];

  // A map linking cities to provinces
  final Map<String, List<String>> cityToProvinces = {
    'Cairo': ['Province 1', 'Province 2'],
    'Alexandria': ['Province 3', 'Province 4'],
    'Matrouh': ['Province 5', 'Province 6'],
  };

  // This will hold the available provinces based on the selected city
  List<String> provinces = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Important to prevent bottom overflow
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView( // Wrapping content to make it scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping, Payment, and Review Steps with divider lines
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.local_shipping,
                      size: 30,
                      color: Colors.green, // Shipping icon color change
                    ),
                    Text('Shipping'),
                  ],
                ),
                Expanded(
                  child: Divider(thickness: 1, color: Colors.grey),
                ),
                Column(
                  children: [
                    Icon(
                      Icons.payment,
                      size: 30,
                      color: Colors.grey, // Payment icon color change
                    ),
                    Text('Payment'),
                  ],
                ),
                Expanded(
                  child: Divider(thickness: 1, color: Colors.grey),
                ),
                Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 30,
                      color: Colors.grey, // Review icon color change
                    ),
                    Text('Finish'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Enter Shipping Details Title
            Center(
              child: Text(
                'Enter Shipping Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),

            // Full Name Input
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Full Name*',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded borders
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            SizedBox(height: 20),

            // Phone Number Input
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number*',
                prefixText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded borders
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            SizedBox(height: 20),

            // City Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded borders
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
              value: selectedCity,
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                  // Update the provinces list based on selected city
                  provinces = cityToProvinces[value!]!;
                  selectedProvince = null; // Reset selected province
                });
              },
              items: cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Province Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Province',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded borders
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
              value: selectedProvince,
              onChanged: (value) {
                setState(() {
                  selectedProvince = value;
                });
              },
              // Show only the provinces related to the selected city
              items: provinces.map((province) {
                return DropdownMenuItem(
                  value: province,
                  child: Text(province),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Street Address Input
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Street Address*',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded borders
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            SizedBox(height: 20),

            // Postal Code Input
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Postal Code*',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded borders
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            SizedBox(height: 20),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/CheckoutTwo');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded button
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
