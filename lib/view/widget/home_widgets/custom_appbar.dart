import 'package:flutter/material.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_search_textfield.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? backButton;
  final Widget? favouriteButton;
  final String appBarTitle;
  final void Function() onSearchPress;
  final void Function() onClosePress;
  final void Function() onNotificationPress;
  final void Function(String)? onChanged;
  final TextEditingController? myController;

  const CustomAppBar(
      {super.key,
      this.backButton,
      required this.appBarTitle,
      this.myController,
      required this.onSearchPress,
      required this.onClosePress,
      required this.onNotificationPress,
      this.favouriteButton,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          backButton ?? const SizedBox(),
          HomeSearchTextField(
            myController: myController,
            onChanged: onChanged,
            appBarTitle: appBarTitle,
            onSearchPress: onSearchPress,
            onClosePress: onClosePress,
          ),
          favouriteButton ?? const SizedBox(),
        ],
      ),
    );
  }
}
