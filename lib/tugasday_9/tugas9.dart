import 'package:flutter/material.dart';

class Tugas9 extends StatelessWidget {
  const Tugas9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Lengkap"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Column(
        children: [
          Text(
            "Ihsan Nur Huda",
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10),
                Text("ihsannurhuda112@gmail.com"),
                Spacer(),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(12)),
          Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 10),
              Text("0812-3456-7890"),
              Spacer(),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(children: [Text("Followers")]),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(children: [Text("Postingan")]),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(11),
            child: Column(
              children: [
                Text(
                  "Deskripsi Profile",
                  style: TextStyle(
                    fontSize: 21,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Kehidupan dan Kematian adalah suatu kesatuan manusia yang hidup akan mati dan manusia yang sudah mati akan hidup",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 83, 9, 180),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container(color: Colors.white)),
          Container(
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.greenAccent,
                  Colors.limeAccent,
                  Colors.orange,
                  Colors.tealAccent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
