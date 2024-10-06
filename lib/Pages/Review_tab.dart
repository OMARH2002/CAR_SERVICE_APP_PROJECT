import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Centered illustration (replace with your asset)
            Center(
              child: Image.asset(
                'assets/images/Thankyou.png', // Replace with your image asset
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),

            // Success Message
            Text(
              'Your order has been placed successfully',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            // Secondary Message
            Text(
              'Thank you for choosing us! Feel free to continue shopping and explore our wide range of products. Happy Shopping!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Continue Shopping Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/apphome');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Continue Shopping',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
