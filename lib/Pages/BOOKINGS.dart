import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'booking_data_saved.dart';

class BookingDetailsPage extends StatefulWidget {
  @override
  _BookingDetailsPageState createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  Booking? booking;
  bool _isExpanded = false; // Track the visibility of additional details

  @override
  void initState() {
    super.initState();
    _loadBookingData();
  }

  Future<void> _loadBookingData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      booking = Booking(
        selectedDate: DateTime.parse(prefs.getString('selectedDate')!),
        selectedTime: prefs.getString('selectedTime')!,
        vehicleType: prefs.getString('vehicleType'),
        vehicleNumber: prefs.getString('vehicleNumber')!,
        make: prefs.getString('make')!,
        model: prefs.getString('model')!,
        selectedServices: prefs.getStringList('selectedServices') ?? [],
        specialInstructions: prefs.getString('specialInstructions')!,
        name: prefs.getString('name')!,
        phone: prefs.getString('phone')!,
        email: prefs.getString('email')!,
        address: prefs.getString('address')!,
      );
    });
  }

  Future<void> _deleteBooking() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all saved data
    setState(() {
      booking = null; // Update the booking variable to null
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: booking == null
            ? Center(child: Text("No Appointments", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))
            : SingleChildScrollView(
          child: _buildBookingInfoCard(),
        ),
      ),
    );
  }

  Widget _buildBookingInfoCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Appointment Date: ${booking!.selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/bookings', // Assuming this is the route for your booking form
                          arguments: booking, // Pass the current booking to edit
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        bool? confirm = await showDialog<bool>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirm Deletion'),
                              content: Text('Are you sure you want to delete this booking?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                                TextButton(
                                  child: Text('Delete'),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ],
                            );
                          },
                        );

                        if (confirm == true) {
                          _deleteBooking(); // Delete booking
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text("Time Slot: ${booking!.selectedTime}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Vehicle Type: ${booking!.vehicleType}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Vehicle Number: ${booking!.vehicleNumber}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            if (_isExpanded) ...[
              Text("Make: ${booking!.make}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Model: ${booking!.model}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Services: ${booking!.selectedServices.join(', ')}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Special Instructions: ${booking!.specialInstructions}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Customer Name: ${booking!.name}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Phone: ${booking!.phone}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Email: ${booking!.email}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Address: ${booking!.address}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
            ],
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded; // Toggle visibility
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _isExpanded ? "See Less" : "See More",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
