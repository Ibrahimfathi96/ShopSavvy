import 'package:flutter/material.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_notification_icon.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_search_textfield.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: const Row(
        children: [
          HomeSearchTextField(),
          SizedBox(
            width: 10,
          ),
          HomeNotificationIcon(),
        ],
      ),
    );
  }
}
