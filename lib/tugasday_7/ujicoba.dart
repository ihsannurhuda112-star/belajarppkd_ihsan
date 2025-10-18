import 'package:flutter/material.dart';

class Ujicoba extends StatelessWidget {
  const Ujicoba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 173, 57),
      appBar: AppBar(
        title: Text("Akun Anda"),
        backgroundColor: Colors.black12,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Text(
              "Admin",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 19,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
