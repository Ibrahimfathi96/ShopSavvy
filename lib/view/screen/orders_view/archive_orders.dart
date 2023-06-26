import 'package:flutter/material.dart';

class ArchivedOrders extends StatelessWidget {
  static const String routeName = '/archived-orders';
  const ArchivedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Archived Orders'),
        ),
        body: Container(
          child: ListView(
            children: [

            ],
          ),
        )
    );;
  }
}
