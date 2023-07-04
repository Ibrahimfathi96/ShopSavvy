import 'package:flutter/material.dart';

class SettingListTileItem extends StatelessWidget {
  final String titleText;
  final void Function()? onTap;
  final Color? containerColor;
  final bool? logoutStyle;
  final Widget iconData;

  const SettingListTileItem(
      {super.key,
      required this.titleText,
      this.containerColor,
      this.logoutStyle = false,
      required this.iconData,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 30).add(
          const EdgeInsets.only(top: 10),
        ),
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: logoutStyle == false
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            iconData,
            const SizedBox(
              width: 20,
            ),
            Text(
              titleText,
              style: logoutStyle == false
                  ? const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              textAlign: TextAlign.center,
            ),
            if(logoutStyle == false)
            Spacer(),
            if(logoutStyle == false)
            Icon(Icons.arrow_forward_ios_outlined,size: 22,)
          ],
        ),
      ),
    );
  }
}
