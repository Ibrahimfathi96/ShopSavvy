import 'package:flutter/material.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: Colors.transparent,
      elevation: 0,
      textColor: Colors.black,
      child: const Text(
        "Skip",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
