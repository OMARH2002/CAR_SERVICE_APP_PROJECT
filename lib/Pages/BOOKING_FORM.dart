import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BOOKINGS.dart';
import 'booking_data_saved.dart';

class Bookings extends StatefulWidget {
  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = '1:00 AM'; // Default time selection
  String? selectedVehicleType;
  List<String> selectedServices = [];
  final _formKey = GlobalKey<FormState>();

  final vehicleNumberController = TextEditingController();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final specialInstructionsController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  List<String> services = [
    'Check the engine oil',
    'Change the engine oil',
    'Air filter replacement',
    'Fuel filter replacement',
    'Replace the aircon filter',
    'Check brake fluid',
    'Refill brake fluid',
    'Check clutch fluid',
    'Check tire conditions',
    'Inspect timing belt or timing chain',
    'Check the battery',
  ];

  List<String> vehicleTypes = [
    'Sedan',
    'Sports Car',
    'Hatchback',
    'SUV',
    'Pickup Truck',
    'Coupe',
    'Wagon',
    'Convertible',
    'Minivan',
    'Hybrid/Electric',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Form"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select an Appointment Date", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "${selectedDate.toLocal()}".split(' ')[0],
                          border: OutlineInputBorder(),
                        ),
                        onTap: () => _selectDate(context),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: selectedTime,
                        items: ['1:00 AM', '2:00 AM', '3:00 AM', '4:00 AM', '7:00 AM', '8:00 AM']
                            .map((time) => DropdownMenuItem(value: time, child: Text(time)))
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedTime = newValue!;
                          });
                        },
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Text("Vehicle Type", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  hint: Text("Select Vehicle Type"),
                  items: vehicleTypes.map((String type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedVehicleType = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),

                _buildTextField(vehicleNumberController, "Vehicle Number"),
                SizedBox(height: 10),
                _buildTextField(makeController, "Make"),
                SizedBox(height: 10),
                _buildTextField(modelController, "Model"),
                SizedBox(height: 20),

                Text("Type of Services", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Column(
                  children: services.map((service) {
                    return CheckboxListTile(
                      title: Text(service),
                      value: selectedServices.contains(service),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selectedServices.add(service);
                          } else {
                            selectedServices.remove(service);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),

                _buildTextField(specialInstructionsController, "Any Special Instructions", maxLines: 3),
                SizedBox(height: 20),

                Text("Customer Information", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                _buildTextField(nameController, "Name"),
                SizedBox(height: 10),
                _buildTextField(phoneController, "Phone"),
                SizedBox(height: 10),
                _buildTextField(emailController, "Email"),
                SizedBox(height: 10),
                _buildTextField(addressController, "Address"),
                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Create a booking instance
                        Booking booking = Booking(
                          selectedDate: selectedDate,
                          selectedTime: selectedTime,
                          vehicleType: selectedVehicleType,
                          vehicleNumber: vehicleNumberController.text,
                          make: makeController.text,
                          model: modelController.text,
                          selectedServices: selectedServices,
                          specialInstructions: specialInstructionsController.text,
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                          address: addressController.text,
                        );

                        // Save data to SharedPreferences
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString('selectedDate', booking.selectedDate.toString());
                        await prefs.setString('selectedTime', booking.selectedTime);
                        await prefs.setString('vehicleType', booking.vehicleType ?? '');
                        await prefs.setString('vehicleNumber', booking.vehicleNumber);
                        await prefs.setString('make', booking.make);
                        await prefs.setString('model', booking.model);
                        await prefs.setString('specialInstructions', booking.specialInstructions);
                        await prefs.setString('name', booking.name);
                        await prefs.setString('phone', booking.phone);
                        await prefs.setString('email', booking.email);
                        await prefs.setString('address', booking.address);
                        await prefs.setStringList('selectedServices', booking.selectedServices);

                        // Pass the booking instance to the BookingDetailsPage
                        Navigator.popAndPushNamed(
                          context,
                          '/bookingdata',
                          arguments: booking,
                        );
                      }
                    },
                    child: Text("Book Now"),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $label";
        }
        return null;
      },
    );
  }
}
