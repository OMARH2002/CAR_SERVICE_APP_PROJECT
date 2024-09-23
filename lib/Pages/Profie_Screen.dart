
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/ThemeNotifier.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = true; // Initial notification state

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeNotifier>(context); // Get the theme provider
    Color textColor = themeProvider.isDarkMode ? Colors.white : Colors.black; // Text color based on theme
    Color boxColor = themeProvider.isDarkMode ? Colors.grey[850]! : Colors.grey[200]!; // Box color based on theme

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: TextStyle(fontWeight: FontWeight.bold)
          ,
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              themeProvider.toggleTheme(); // Toggle the theme
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Profile with edit icon inside the avatar
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue[100],
                  child: Image.asset('assets/images/person.png'),
                ),

              ],
            ),
            SizedBox(height: 10),
            Text(
              'Steve',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
            ),
            SizedBox(height: 5),
            SizedBox(height: 30),

            // Profile options
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: boxColor, // Use the dynamic box color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,'/EditProfileData');
                    },
                    child: buildProfileOption(
                      icon: Icons.person_outline,
                      title: 'Profile',
                      textColor: textColor,
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _notificationsEnabled = !_notificationsEnabled; // Toggle notification state
                      });
                    },
                    child: buildProfileOption(
                      icon: Icons.notifications_none,
                      title: 'Notifications',
                      trailing: Text(
                        _notificationsEnabled ? 'ON' : 'OFF',
                        style: TextStyle(color: textColor),
                      ),
                      textColor: textColor,
                    ),
                  ),
                  Divider(),
                  buildProfileOption(
                    icon: Icons.language,
                    title: 'Language',
                    trailing: Text('English', style: TextStyle(color: textColor)),
                    textColor: textColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Other options...
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: boxColor, // Use the dynamic box color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  buildProfileOption(
                    icon: Icons.security,
                    title: 'Security',
                    textColor: textColor,
                  ),
                  Divider(),
                  buildProfileOption(
                    icon: Icons.brightness_6,
                    title: 'Theme',
                    trailing: Text(themeProvider.isDarkMode ? 'Dark mode' : 'Light mode', style: TextStyle(color: textColor)),
                    textColor: textColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Help & Support section...
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: boxColor, // Use the dynamic box color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  buildProfileOption(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    textColor: textColor,
                  ),
                  Divider(),
                  buildProfileOption(
                    icon: Icons.contact_mail_outlined,
                    title: 'Contact us',
                    textColor: textColor,
                  ),
                  Divider(),
                  buildProfileOption(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy policy',
                    textColor: textColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Reusable method to build the profile option widget
  Widget buildProfileOption({
    required IconData icon,
    required String title,
    Widget trailing = const SizedBox(),
    required Color textColor, // Pass the text color as a parameter
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: textColor),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16, color: textColor), // Use the dynamic text color
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
