import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/ThemeNotifier.dart';
import 'ProfileDataDisplay.dart'; // Import the new screen

class EditProfileData extends StatefulWidget {
  const EditProfileData({super.key});

  @override
  State<EditProfileData> createState() => _EditProfileDataState();
}

class _EditProfileDataState extends State<EditProfileData> {
  String selectedCountryCode = '🇺🇸 +1'; // Default country code

  // Variables to store user input
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String selectedCountry = 'United States';
  String selectedGender = 'Female';
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeNotifier>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return WillPopScope(
      onWillPop: () async {
        // Return true to allow back navigation
        return true;
      },
      child: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          elevation: 0,
          title: Text(
            'Edit Profile',
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(
                controller: _fullNameController,
                labelText: 'Full Name',
                isDarkMode: isDarkMode,
              ),
              SizedBox(height: 16),
              buildTextField(
                controller: _nickNameController,
                labelText: 'Nick Name',
                isDarkMode: isDarkMode,
              ),
              SizedBox(height: 16),
              buildTextField(
                controller: _emailController,
                labelText: 'E-mail',
                isDarkMode: isDarkMode,
              ),
              SizedBox(height: 16),
              buildPhoneInputField(isDarkMode),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: buildDropdownField(
                      labelText: 'Country',
                      value: selectedCountry,
                      items: [
                        'United States',
                        'Canada',
                        'India',
                        'Mexico',
                        'Egypt',
                        'United Kingdom',
                        'Australia',
                        'Germany',
                        'France',
                        'Japan'
                      ],
                      isDarkMode: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: buildDropdownField(
                      labelText: 'Gender',
                      value: selectedGender,
                      items: ['Male', 'Female'],
                      isDarkMode: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              buildTextField(
                controller: _addressController,
                labelText: 'Address',
                isDarkMode: isDarkMode,
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the ProfileDataDisplay page and pass the data
                    Navigator.pushNamed(
                      context,
                      '/ProfileDataDisplay',
                      arguments: ProfileDataArguments(
                        fullName: _fullNameController.text,
                        nickName: _nickNameController.text,
                        email: _emailController.text,
                        countryCode: selectedCountryCode,
                        phoneNumber: _phoneNumberController.text,
                        country: selectedCountry,
                        gender: selectedGender, address: '',
                      ),
                    ).then((_) {
                      // Optionally reset the form after returning
                      resetForm();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetForm() {
    // Optionally reset the form fields if needed
    _fullNameController.clear();
    _nickNameController.clear();
    _emailController.clear();
    _phoneNumberController.clear();
    selectedCountry = 'United States';
    selectedGender = 'Female';
    _addressController.clear();
  }

  // Updated method to build TextFields
  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required bool isDarkMode,
  }) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: isDarkMode ? Colors.grey : Colors.black),
        ),
      ),
    );
  }

  Widget buildPhoneInputField(bool isDarkMode) {
    return Row(
      children: [
        Container(
          width: 100,
          child: DropdownButton<String>(
            value: selectedCountryCode,
            isExpanded: true,
            onChanged: (String? newValue) {
              setState(() {
                selectedCountryCode = newValue!;
              });
            },
            items: [
              '🇺🇸 +1',
              '🇨🇦 +1',
              '🇬🇧 +44',
              '🇦🇺 +61',
              '🇮🇳 +91',
              '🇩🇪 +49',
              '🇫🇷 +33',
              '🇯🇵 +81',
              '🇧🇷 +55',
              '🇲🇽 +52',
              '🇪🇬 +20',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
              );
            }).toList(),
            dropdownColor: isDarkMode ? Colors.black : Colors.white,
            iconEnabledColor: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: _phoneNumberController,
            keyboardType: TextInputType.phone,
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            decoration: InputDecoration(
              labelText: 'Phone Number',
              labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownField({
    required String labelText,
    required String value,
    required List<String> items,
    required bool isDarkMode,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      dropdownColor: isDarkMode ? Colors.black : Colors.white,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
        );
      }).toList(),
    );
  }
}
