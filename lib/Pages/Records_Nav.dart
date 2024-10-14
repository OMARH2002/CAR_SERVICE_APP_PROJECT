import 'package:flutter/material.dart';

import 'records_data_entry.dart';


class RecordsNav extends StatefulWidget {
  const RecordsNav({super.key});

  @override
  State<RecordsNav> createState() => _RecordsNavState();
}

class _RecordsNavState extends State<RecordsNav> {
  String lastmaintenance = '';
  String lastoilchange = '';
  String lasttyrechange = '';
  final List<Map<String, dynamic>> history = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('Records',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) {
            return build3DBox(
              content: 'Last Maintenance: ${history[index]['lastmaintenance']}\nLast Oil change: ${history[index]['lastoilchange']}\nLast Tyre Change:${history[index]['lasttyrechange']}',

            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecordsEntry()),
          );

          if (result != null) {
            // Update the list of cars with the new entry
            setState(() {
              history.add(result);
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







