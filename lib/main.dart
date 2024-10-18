import 'package:depci_grad_project/Pages/BOOKING_FORM.dart';
import 'package:depci_grad_project/Pages/Bottom_Nav.dart';
import 'package:depci_grad_project/Pages/Checkout_one.dart';
import 'package:depci_grad_project/Pages/Edit_Profile_Data.dart';
import 'package:depci_grad_project/Pages/car_service.dart';
import 'package:depci_grad_project/Pages/splash_screen.dart';
import 'package:depci_grad_project/theme/ThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/BOOKINGS.dart';
import 'Pages/Car_data_entery.dart';
import 'Pages/Denting.dart';
import 'Pages/OilProducts.dart';
import 'Pages/Payment_Tab.dart';
import 'Pages/Profie_Screen.dart';
import 'Pages/ProfileDataDisplay.dart';
import 'Pages/Records_Nav.dart';
import 'Pages/Review_tab.dart';
import 'Pages/Tyres.dart';
import 'Pages/Veichles_Nav.dart';
import 'Pages/ac.dart';
import 'Pages/batteries.dart';
import 'Pages/brakes.dart';
import 'Pages/Autocarwash.dart';
import 'Pages/exterior.dart';
import 'Pages/help.dart';
import 'Pages/insurance.dart';
import 'Pages/interior.dart';
import 'Pages/records_data_entry.dart';
import 'Pages/windsheild.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Times New Roman',
        brightness: themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: const Scaffold(body: SplashScreen()),
      routes: {
        '/apphome':(context)=>const MyApp(),
        '/CarService': (context) => CarService(),
        '/BottomPage': (context) => const BottomPage(),
        '/Tyres': (context) => Tyres(),
        '/Denting': (context) => Denting(),
        '/AC': (context) => AC(),
        '/Interior': (context) => Interior(),
        '/Exterior':(context)=>const Exterior(),
        '/Batteries': (context) => Batteries(),
        '/Insurance': (context) => Insurance(),
        '/Windsheild': (context) => Windsheild(),
        '/Brakes': (context) => Brakes(),
        '/AutoCarWash': (context) => const AutoCarWash(),
        '/Oiling': (context) => OilProducts(),
        '/EditProfileData': (context) => const EditProfileData(),
        '/Records': (context) => const RecordsNav(),
        '/Veichles': (context) => const VeichlesNav(),
        '/CarFormPage': (context) => CarFormPage(),
        '/ProfileScreen': (context) => ProfileScreen(),
        '/ProfileDataDisplay': (context) => ProfileDataDisplay(),
        '/CheckoutOne':(context)=>CheckoutScreenOne(),
        '/CheckoutTwo':(context)=>CheckoutScreenTwo(),
        '/OrderSuccess':(context)=>const OrderSuccessScreen(),
        '/bookingform':(context)=>Bookings(),
        '/bookingdata':(context)=>BookingDetailsPage(),
        '/RecordsEntry':(context)=>RecordsEntry(),
        '/help':(context)=>HelpSupportPage()
      },
    );
  }
}
