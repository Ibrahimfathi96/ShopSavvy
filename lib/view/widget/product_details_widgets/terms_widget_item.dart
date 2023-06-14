import 'package:flutter/material.dart';

class TermsWidgetItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const TermsWidgetItem({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            width: 60,height: 60,fit: BoxFit.cover,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Color(0xFF77B3BE)),
          ),
        ],
      ),
    );
  }
}
