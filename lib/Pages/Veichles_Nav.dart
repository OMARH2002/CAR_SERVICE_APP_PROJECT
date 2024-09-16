import 'package:flutter/material.dart';

import 'Car_data_entery.dart';
class VeichlesNav extends StatefulWidget {
  const VeichlesNav({super.key});

  @override
  State<VeichlesNav> createState() => _VeichlesNavState();
}

class _VeichlesNavState extends State<VeichlesNav> {
  String carBrand = '';
  String carModel = '';
  String carYear = '';
  final List<Map<String, dynamic>> cars = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('Cars',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            return build3DBox(
              content: 'Car Brand: ${cars[index]['brand']}\nCar Model: ${cars[index]['model']}\nCar Year:${cars[index]['year']}',

            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CarFormPage()),
          );

          if (result != null) {
            // Update the list of cars with the new entry
            setState(() {
              cars.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Function to create the 3D box design with image
  Widget build3DBox({required String content}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(10, 10),
            blurRadius: 15,
          ),
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(-10, -10),
            blurRadius: 15,
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}







