import 'package:flutter/material.dart';

class booking extends StatelessWidget {
  const booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Booking'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
              // Handle back button press
            },
          ),
        )
    );
  }
}
