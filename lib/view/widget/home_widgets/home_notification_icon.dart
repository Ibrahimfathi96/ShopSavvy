import 'package:flutter/material.dart';

class HomeNotificationIcon extends StatelessWidget {
  final void Function()? onNotificationPress;
  const HomeNotificationIcon({
    super.key, this.onNotificationPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: IconButton(
        onPressed: onNotificationPress,
        icon: Icon(
          Icons.notifications_active_outlined,
          size: 36,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
