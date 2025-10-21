import 'package:flutter/material.dart';

class AdminWidget extends StatelessWidget {
  const AdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tentang admin")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Nama Pembuat Apk:IHSAN NUR HUDA",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "Aplikasi ini dibuat karena admin malas dan gabut",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Versi 19.0", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
