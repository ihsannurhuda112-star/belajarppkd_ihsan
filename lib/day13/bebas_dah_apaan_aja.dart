import 'package:flutter/material.dart';

class BebasDahApaanAja extends StatelessWidget {
  final String hintText;
  const BebasDahApaanAja({
    super.key,
    required this.hide,
    required this.hintText,
  });

  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      height: 50,
      margin: EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(hide ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ),
    );
  }
}
