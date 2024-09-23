
import 'package:flutter/material.dart';

class ProfileDataArguments {
  final String fullName;
  final String nickName;
  final String email;
  final String? countryCode; // Make nullable
  final String? phoneNumber; // Make nullable
  final String country;
  final String gender;
  final String address;


  ProfileDataArguments({
    required this.fullName,
    required this.nickName,
    required this.email,
    this.countryCode,
    this.phoneNumber,
    required this.country,
    required this.gender,
    required this.address,

  });
}

class ProfileDataDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments safely
    final args = ModalRoute.of(context)!.settings.arguments as ProfileDataArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Data'),
        centerTitle: true,
actions: [
  IconButton(onPressed:(){
    Navigator.pushNamed(context, '/apphome');
  },
    icon: Icon(Icons.check),)
],
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/images/person.png'),
                  ),
                  SizedBox(height: 20),

                  // Full Name
                  _buildDataCard('Full Name', args.fullName),
                  SizedBox(height: 10),

                  // Nick Name
                  _buildDataCard('Nick Name', args.nickName),
                  SizedBox(height: 10),

                  // E-mail
                  _buildDataCard('E-mail', args.email),
                  SizedBox(height: 10),

                  // Phone
                  _buildDataCard('Phone', '${args.countryCode} ${args.phoneNumber}'),
                  SizedBox(height: 10),

                  // Country
                  _buildDataCard('Country', args.country),
                  SizedBox(height: 10),

                  // Gender
                  _buildDataCard('Gender', args.gender),
                  SizedBox(height: 10),

                  // Address
                  _buildDataCard('Address', args.address),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataCard(String title, String data) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                data,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
