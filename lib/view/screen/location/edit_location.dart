import 'package:flutter/material.dart';

class EditLocation extends StatelessWidget {
  static const String routeName = '/location-edit';
  const EditLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Your Location"),),
      body: Container(
        child: ListView(
        ),
      ),
    );
  }
}
