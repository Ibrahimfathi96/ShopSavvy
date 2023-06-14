import 'package:flutter/material.dart';

class CustomColorContainer extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color textColor;
  final Color containerColor;
  final void Function() onTap;

  const CustomColorContainer({
    super.key,
    required this.text,
    required this.borderColor,
    required this.textColor,
    required this.containerColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        alignment: Alignment.center,
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
