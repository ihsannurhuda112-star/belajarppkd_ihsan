import 'package:flutter/material.dart';

class Rthome extends StatefulWidget {
  const Rthome({super.key});

  @override
  State<Rthome> createState() => _RthomeState();
}

class _RthomeState extends State<Rthome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Kontribusi saya",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Nama"),
          ],
        ),
      ),
    );
  }
}
