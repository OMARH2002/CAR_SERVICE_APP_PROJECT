import 'package:flutter/material.dart';

class CheckoutScreenTwo extends StatefulWidget {
  @override
  _CheckoutScreenTwoState createState() => _CheckoutScreenTwoState();
}

class _CheckoutScreenTwoState extends State<CheckoutScreenTwo> {
  String? selectedPaymentMethod = 'Credit Card';
  final TextEditingController paypalController = TextEditingController();
  final TextEditingController googlePayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensures content adjusts when the keyboard appears
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
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView( // Makes the page scrollable
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
                      color: Colors.green, // Payment icon color change
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

            // Payment Method Selection
            Center(
              child: Text(
                'Select a Payment Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),

            // Payment Method Options
            buildPaymentOption(
              image: 'assets/images/Mastercard-logo 1.png',
              title: 'Credit Card',
              value: 'Credit Card',
            ),
            buildPaymentOption(
              image: 'assets/images/Paypal.png',
              title: 'PayPal',
              value: 'PayPal',
            ),
            buildPaymentOption(
              image: 'assets/images/Gpay.png',
              title: 'Google Pay',
              value: 'Google Pay',
            ),
            SizedBox(height: 20),

            // Conditionally show inputs based on selected payment method
            if (selectedPaymentMethod == 'PayPal') ...[
              TextFormField(
                controller: paypalController,
                decoration: InputDecoration(
                  labelText: 'PayPal Link',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],

            if (selectedPaymentMethod == 'Google Pay') ...[
              TextFormField(
                controller: googlePayController,
                decoration: InputDecoration(
                  labelText: 'Google Account Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],

            if (selectedPaymentMethod == 'Credit Card') ...[
              // Card Details
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Card Holder Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        hintText: 'MM/YY',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        hintText: '123',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],

            // Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/OrderSuccess');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Confirm Order',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build Payment Option Widget
  Widget buildPaymentOption({required String image, required String title, required String value}) {
    return ListTile(
      leading: Image.asset(image, width: 50),
      title: Text(title),
      trailing: Radio<String>(
        value: value,
        groupValue: selectedPaymentMethod,
        onChanged: (String? newValue) {
          setState(() {
            selectedPaymentMethod = newValue;
          });
        },
      ),
    );
  }
}
