
import 'package:flutter/material.dart';


class RecordsEntry extends StatefulWidget {
  @override
  _RecordsEntryState createState() => _RecordsEntryState();
}

class _RecordsEntryState extends State<RecordsEntry> {
  final _formKey = GlobalKey<FormState>();
  String _lastMaintenance = '';
  String _lastoilchange = '';
  String _lasttyrechange = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Car History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Maintenance'),
                onSaved: (value) {
                  _lastMaintenance = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Oil Change'),
                onSaved: (value) {
                  _lastoilchange = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Tyres Change'),
                onSaved: (value) {
                  _lasttyrechange = value ?? '';
                },
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, {
                      'lastmaintenance': _lastMaintenance,
                      'lastoilchange': _lastoilchange,
                      'lasttyrechange':_lasttyrechange,
                    });
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}