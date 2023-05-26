import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPTextFields extends StatelessWidget {
  final void Function(String) onSubmit;
  final void Function(String) onCodeChanged;
  const OTPTextFields({
    super.key, required this.onSubmit, required this.onCodeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      fieldWidth: 50,
      borderRadius: BorderRadius.circular(20),
      numberOfFields: 5,
      borderColor: const Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged:onCodeChanged,
      onSubmit: onSubmit, // end onSubmit
    );
  }
}
