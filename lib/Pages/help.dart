import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'), // Vibrant header background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section for Help Categories
            _buildHelpCategory(context, 'FAQs', Icons.question_answer),
            SizedBox(height: 30,),
            _buildHelpCategory(context, 'Contact Us', Icons.phone),
            SizedBox(height: 30,),

            Spacer(),

            // Live Chat button at the bottom
            _buildStickyLiveChatButton(context),
          ],
        ),
      ),
    );
  }

  // Function to build each help category
  Widget _buildHelpCategory(BuildContext context, String title, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 5,


      child: ListTile(
        leading: Icon(icon, size: 35, color: Colors.blueAccent),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
        onTap: () {
          // Navigate to respective support section
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _getSupportPage(title)),
          );
        },
      ),
    );
  }
  // Function to build sticky live chat button
  Widget _buildStickyLiveChatButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Navigate to Live Chat or Support
        Navigator.push(context, MaterialPageRoute(builder: (context) => LiveChatPage()));
      },
      icon: Icon(Icons.chat_bubble_outline),
      label: Text("Live Chat Support"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent, // Chat button color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 15),
        textStyle: TextStyle(fontSize: 18),
      ),
    );
  }

  // Sample function to get different pages based on category
  Widget _getSupportPage(String title) {
    switch (title) {
      case 'FAQs':
        return FAQPage();
      case 'Contact Us':
        return ContactUsPage();
      default:
        return HelpSupportPage(); // Default page fallback
    }
  }
}

// Dummy pages for different sections
class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs')),
      body: Center(child: Text('Frequently Asked Questions')),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: Center(child: Text('Contact Us Information')),
    );
  }
}



class LiveChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Chat')),
      body: Center(child: Text('Live Chat Support')),
    );
  }
}
