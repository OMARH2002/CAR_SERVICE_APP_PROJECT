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
  String? selectedService;
  String? selectedSubService;
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
    'Car Service',
    'Denting & Painting',
    'AC Services & Repair',
    'Interior Cleaning',
    'Windshield &Lights',
    'Clutch & Brakes',
    'Exterior Clean',
    'Auto Car Wash'

  ];

  Map<String, List<String>> subServices = {
    'Car Service': [
      'Basic Service',
      'Standard Service',
      'Comprehensive Service'

    ],
    'Denting & Painting': [
      'Minor Dent Repair',
      'Full Body Repainting',
      'Scratch and Paint Touch-Up',
      'Panel Replacement and Painting',
      'Rust treatment and Repainting'
    ],
    'AC Services & Repair': [
      'AC Diagnostic Check',
      'AC Recharge',
      'AC Compressor Replacement',
      'AC System Leak Repair',
    ],
    'Interior Cleaning':[
      'Basic Interior Cleaning',
      'Deep Interior Cleaning',
      'Leather Seat Cleaning',
      'Odor Removal Treatment'
    ],

    'Windshield &Lights': [
      '',
    ],

    'Clutch & Brakes': [
      '',
    ],

    'Exterior Clean': [
      '',
    ],
    'Auto Car Wash': [
      '',
    ],





  };

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

                _buildTextField(vehicleNumberController, "Vehicle Brand"),
                SizedBox(height: 10),
                _buildTextField(makeController, "Model"),
                SizedBox(height: 10),
                _buildTextField(modelController, "Year"),
                SizedBox(height: 20),

                Text("Select Service", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  hint: Text("Select a Service"),
                  value: selectedService,
                  items: services.map((String service) {
                    return DropdownMenuItem(
                      value: service,
                      child: Text(service),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedService = newValue;
                      selectedSubService = null; // Reset sub-service when service changes
                    });
                  },
                ),
                SizedBox(height: 10),

                if (selectedService != null) ...[
                  Text("Select Sub-service", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    hint: Text("Select a Sub-service"),
                    value: selectedSubService,
                    items: subServices[selectedService!]!.map((String subService) {
                      return DropdownMenuItem(
                        value: subService,
                        child: Text(subService),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSubService = newValue;
                      });
                    },
                  ),
                ],
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
                          selectedServices: [selectedService!, selectedSubService!],
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
                        await prefs.setStringList('selectedServices', [selectedService!, selectedSubService!]);

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
