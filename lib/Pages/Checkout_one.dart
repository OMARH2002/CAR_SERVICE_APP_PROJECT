import 'package:flutter/material.dart';

class CheckoutScreenOne extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreenOne> {
  String? selectedProvince;
  String? selectedCity;

  int currentStep = 1; // To track which step you're on

  final provinces = ['Province 1', 'Province 2', 'Province 3'];
  final cities = ['City 1', 'City 2', 'City 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
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
                      color: currentStep >= 1 ? Colors.green : Colors.grey, // Shipping icon color change
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
                      color: currentStep >= 2 ? Colors.green : Colors.grey, // Payment icon color change
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
                      color: currentStep == 3 ? Colors.green : Colors.grey, // Review icon color change
                    ),
                    Text('Review'),
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
              items: provinces.map((province) {
                return DropdownMenuItem(
                  value: province,
                  child: Text(province),
                );
              }).toList(),
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
            Spacer(),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (currentStep < 3) {
                      currentStep += 1; // Move to next step
                    } else {
                      // Handle final confirmation
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16), backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded button
                  ),
                ),
                child: Text(currentStep < 3 ? 'Next' : 'Confirm', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
