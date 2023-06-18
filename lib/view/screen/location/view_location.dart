import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class LocationView extends StatelessWidget {
  static const String routeName = '/location-view';
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: (){},
        child: const Icon(Icons.add,size: 36),
      ),
      appBar: AppBar(title: Text("Location"),),
      body: Container(
        child: ListView(
        ),
      ),
    );
  }
}
