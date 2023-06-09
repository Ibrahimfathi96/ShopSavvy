import 'package:flutter/material.dart';

class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: const Icon(Icons.search_outlined),
          hintText: "Find your product..",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
