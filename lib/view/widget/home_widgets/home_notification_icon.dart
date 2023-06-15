import 'package:flutter/material.dart';

class HomeAppBarIcons extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;

  const HomeAppBarIcons({
    super.key,
    this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          size: 30,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
