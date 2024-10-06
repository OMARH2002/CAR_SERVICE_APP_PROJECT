class Booking {
  final DateTime selectedDate;
  final String selectedTime;
  final String? vehicleType;
  final String vehicleNumber;
  final String make;
  final String model;
  final List<String> selectedServices;
  final String specialInstructions;
  final String name;
  final String phone;
  final String email;
  final String address;

  Booking({
    required this.selectedDate,
    required this.selectedTime,
    this.vehicleType,
    required this.vehicleNumber,
    required this.make,
    required this.model,
    required this.selectedServices,
    required this.specialInstructions,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });
}
