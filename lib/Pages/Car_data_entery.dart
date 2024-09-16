import 'dart:io';

import 'package:flutter/material.dart';


class CarFormPage extends StatefulWidget {
  @override
  _CarFormPageState createState() => _CarFormPageState();
}

class _CarFormPageState extends State<CarFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _carBrand = '';
  String _carModel = '';
  String _carYear = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Car Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Car Brand'),
                onSaved: (value) {
                  _carBrand = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Car Model'),
                onSaved: (value) {
                  _carModel = value ?? '';
                },
              ),
         TextFormField(
          decoration: InputDecoration(labelText: 'Car Year'),
          onSaved: (value) {
            _carYear = value ?? '';
          },
         ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, {
                      'brand': _carBrand,
                      'model': _carModel,
                        'year':_carYear,
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