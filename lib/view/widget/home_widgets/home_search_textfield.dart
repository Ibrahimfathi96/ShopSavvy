import 'package:flutter/material.dart';

class HomeSearchTextField extends StatelessWidget {
  final String appBarTitle ;
  final void Function()? onSearchPress ;
  const HomeSearchTextField({
    super.key, required this.appBarTitle, this.onSearchPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: onSearchPress,
          ),
          hintText: appBarTitle,
          hintStyle: const TextStyle(
            fontSize: 14
          ),
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
