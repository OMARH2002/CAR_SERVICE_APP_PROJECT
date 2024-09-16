import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
        body: SafeArea(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Profile-Icon.png'),
              ),
              const SizedBox(height: 12),
              const Text(
                'Omar Hany ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),
              const MenuItem(icon: Icons.privacy_tip, title: 'Privacy'),
              const MenuItem(icon: Icons.history, title: 'Purchase History'),
              const MenuItem(icon: Icons.support, title: 'Help & Support'),
              const MenuItem(icon: Icons.settings, title: 'Settings'),
              const MenuItem(icon: Icons.person_add, title: 'Invite a Friend'),
              const MenuItem(icon: Icons.logout, title: 'Logout')
            ],
          ),
        ),
      );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 16,
        ),
        onTap: () {
          // Action when tapped
        },
      ),
    );
  }
}

