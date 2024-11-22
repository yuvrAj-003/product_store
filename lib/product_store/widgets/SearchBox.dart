import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MySearchBox extends StatelessWidget {
  const MySearchBox({
    required this.controller,
    required this.focusNode,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: controller,
      decoration: InputDecoration(
        filled: true,
        // search button
        suffixIcon: IconButton(
          icon: const Icon(Ionicons.search_outline),
          onPressed: () {},
        ),
        // background color
        fillColor: const Color(0xFFEEEEEE),
        // border
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        // search text
        hintText: 'Search',
      ),
    );
  }
}
