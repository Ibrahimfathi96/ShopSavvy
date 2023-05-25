import 'package:flutter/material.dart';

class CustomAuthTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? controller;
  final bool obscureText;

  const CustomAuthTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
   this.controller, this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16,bottom: 16),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 30),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.deepOrangeAccent
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.deepOrangeAccent
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          label: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              labelText,
            ),
          ),
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,color: Colors.deepOrangeAccent
          ),
          suffixIcon: Icon(
            iconData,color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
