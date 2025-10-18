import 'package:flutter/material.dart';

class Eskp4 extends StatelessWidget {
  const Eskp4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas Flutter 4"),
        backgroundColor: Colors.tealAccent,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12),
        children: [
          SingleChildScrollView(),
          Text("Formulir Pengguna", style: TextStyle(fontSize: 20)),
          Text("Nama"),
          Container(
            color: Colors.white,
            height: 80,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukan nama anda",
              ),
            ),
          ),
          SizedBox(height: 4),
          Text("Email"),
          Container(
            color: Colors.white,
            height: 80,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukan email anda",
              ),
            ),
          ),
          SizedBox(height: 4),
          Text("No Hp"),
          Container(
            color: Colors.white,
            height: 80,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukan no Hp anda",
              ),
            ),
          ),
          SizedBox(height: 4),
          Text("Deskripsi"),
          Container(
            color: Colors.white,
            height: 80,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukan Deskripsi anda",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
