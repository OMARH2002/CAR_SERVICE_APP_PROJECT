import 'package:depci_grad_project/Pages/Bottom_Nav.dart';
import 'package:depci_grad_project/Pages/Profile_Data.dart';
import 'package:depci_grad_project/Pages/car_service.dart';
import 'package:flutter/material.dart';
import 'Pages/Car_data_entery.dart';
import 'Pages/Denting.dart';
import 'Pages/OilChange.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Times New Roman'),
      home:Scaffold(
        body: BottomPage()
        ),
      routes: {
        '/CarService':(context)=>CarService(),
        '/Tyres':(context)=>Tyres(),
        '/Denting':(context)=>Denting(),
        '/AC':(context)=>AC(),
        '/Interior':(context)=>Interior(),
        '/Batteries':(context)=>Batteries(),
        '/Insurance':(context)=>Insurance(),
        '/Windsheild':(context)=>Windsheild(),
        '/Brakes':(context)=>Brakes(),
        //'/Exterior':(context)=>Exterior(),
        '/AutoCarWash':(context)=>AutoCarWash(),
        '/Oiling':(context)=>OilChange(),
        '/ProfileData':(context)=>ProfileData(),
        '/Records':(context)=>RecordsNav(),
        '/Veichles':(context)=>VeichlesNav(),
        '/CarFormPage':(context)=>CarFormPage()


      },
      );
  }
}


