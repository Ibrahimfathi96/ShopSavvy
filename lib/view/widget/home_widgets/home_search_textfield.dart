import 'package:flutter/material.dart';

class HomeSearchTextField extends StatelessWidget {
  final String appBarTitle;
  final TextEditingController? myController;
  final void Function()? onSearchPress;
  final void Function()? onClosePress;
  final void Function(String)? onChanged;

  const HomeSearchTextField({
    super.key,
    this.myController,
    required this.appBarTitle,
    this.onSearchPress,
    this.onClosePress,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        cursorColor: Colors.black,
        controller: myController,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: IconButton(
            icon: const Icon(Icons.search_outlined,size: 32,color: Colors.grey,),
            onPressed: onSearchPress,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close_outlined,size: 32,color: Colors.grey,),
            onPressed: onClosePress,
          ),
          hintText: appBarTitle,
          hintStyle: const TextStyle(fontSize: 14),
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
