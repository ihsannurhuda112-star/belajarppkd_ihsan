import 'package:belajarppkd_ihsan/day13/tugasflutter6.dart';
import 'package:flutter/material.dart';

class End extends StatefulWidget {
  const End({super.key});

  @override
  State<End> createState() => _EndState();
}

class _EndState extends State<End> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Tugasflutter6()),
            );
          },
          child: Text("Back"),
        ),
      ),
    );
  }
}
