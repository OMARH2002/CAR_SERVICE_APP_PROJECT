import 'package:depci_grad_project/Pages/BOOKING_FORM.dart';
import 'package:depci_grad_project/Pages/Bottom_Nav.dart';
import 'package:depci_grad_project/Pages/Checkout_one.dart';
import 'package:depci_grad_project/Pages/Edit_Profile_Data.dart';
import 'package:depci_grad_project/Pages/car_service.dart';
import 'package:depci_grad_project/theme/ThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/Car_data_entery.dart';
import 'Pages/Denting.dart';
import 'Pages/OilChange.dart';
import 'Pages/Profie_Screen.dart';
import 'Pages/ProfileDataDisplay.dart';
import 'Pages/Records_Nav.dart';
import 'Pages/Tyres.dart';
import 'Pages/Veichles_Nav.dart';
import 'Pages/ac.dart';
import 'Pages/batteries.dart';
import 'Pages/brakes.dart';
import 'Pages/Autocarwash.dart';
import 'Pages/exterior.dart';
import 'Pages/insurance.dart';
import 'Pages/interior.dart';
import 'Pages/windsheild.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Times New Roman',
        brightness: themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(body: BottomPage()),
      routes: {
        '/apphome':(context)=>MyApp(),
        '/CarService': (context) => CarService(),
        'BottomPage': (context) => BottomPage(),
        '/Tyres': (context) => Tyres(),
        '/Denting': (context) => Denting(),
        '/AC': (context) => AC(),
        '/Interior': (context) => Interior(),
        '/Batteries': (context) => Batteries(),
        '/Insurance': (context) => Insurance(),
        '/Windsheild': (context) => Windsheild(),
        '/Brakes': (context) => Brakes(),
        '/AutoCarWash': (context) => AutoCarWash(),
        '/Oiling': (context) => OilChange(),
        '/EditProfileData': (context) => EditProfileData(),
        '/Records': (context) => RecordsNav(),
        '/Veichles': (context) => VeichlesNav(),
        '/CarFormPage': (context) => CarFormPage(),
        '/ProfileScreen': (context) => ProfileScreen(),
        '/ProfileDataDisplay': (context) => ProfileDataDisplay(),
        '/CheckoutOne':(context)=>CheckoutScreenOne(),
        '/bookingform':(context)=>booking()

      },
    );
  }
}
