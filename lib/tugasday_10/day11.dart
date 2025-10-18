import 'package:flutter/material.dart';

class Day11 extends StatelessWidget {
  const Day11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 3 Flutter"),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Formulir Pengguna", style: TextStyle(fontSize: 20)),
              Text("Nama"),
              Container(
                color: Colors.white,
                height: 80,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukan Nama Anda",
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
                    hintText: "Masukan Email Anda",
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
                    hintText: "Masukan No HP Anda",
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
                    hintText: "Masukan Deskripsi Anda",
                  ),
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(height: 20, width: 300, color: Colors.blue),
                        Container(
                          height: 200,
                          width: 200,
                          color: Colors.yellowAccent,
                        ),
                        Text("INI KOTAK"),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
