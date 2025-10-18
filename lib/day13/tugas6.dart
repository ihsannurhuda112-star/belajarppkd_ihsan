import 'package:flutter/material.dart';

class Tugas6 extends StatelessWidget {
  const Tugas6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100, width: 100),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/instagram.png'),
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              height: 50,
              margin: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Phone Number,Username Or Email",
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              height: 50,
              margin: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Password",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
