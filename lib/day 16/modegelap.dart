import 'package:flutter/material.dart';

class ModegelapWidget extends StatefulWidget {
  const ModegelapWidget({super.key});

  @override
  State<ModegelapWidget> createState() => _ModegelapWidgetState();
}

class _ModegelapWidgetState extends State<ModegelapWidget> {
  bool isGelap = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isGelap ? Colors.black : Colors.white,
      child: Column(
        children: [
          Text(
            "Aktifkan Mode Gelap",
            style: TextStyle(color: isGelap ? Colors.white : Colors.black),
          ),
          Switch(
            value: isGelap,
            onChanged: (value) {
              setState(() {
                isGelap = value;
              });
            },
          ),
          Text(
            isGelap ? "Mode Gelap Aktif" : "Mode Terang aktif",
            style: TextStyle(color: isGelap ? Colors.white : Colors.black),
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: isGelap ? Colors.black : Colors.white,
          ),
        ],
      ),
    );
  }
}
