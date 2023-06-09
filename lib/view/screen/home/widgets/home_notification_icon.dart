import 'package:flutter/material.dart';

class HomeNotificationIcon extends StatelessWidget {
  const HomeNotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.notifications_active_outlined,
          size: 36,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
