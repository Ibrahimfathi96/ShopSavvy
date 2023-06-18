import 'package:flutter/material.dart';

class AddLocation extends StatelessWidget {
  static const String routeName = '/location-add';
  const AddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("العناوين"),),
      body: Container(
        child: ListView(
        ),
      ),
    );
  }
}
