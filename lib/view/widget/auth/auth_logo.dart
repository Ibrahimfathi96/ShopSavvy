import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/image_assets.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageFromAssets.authLogo,
      height: 150,
    );
  }
}
