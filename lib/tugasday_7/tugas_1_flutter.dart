import 'package:flutter/material.dart';

class Tugas1Flutter extends StatelessWidget {
  const Tugas1Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(title: Text("Profile Saya"), backgroundColor: Colors.red),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              "Ihsan Nur Huda",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Text(
                  "Jakarta",
                  style: TextStyle(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 44, 20, 184),
                  ),
                ),
              ],
            ),
            Text("Saya sedang nyari waifu ", style: TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
