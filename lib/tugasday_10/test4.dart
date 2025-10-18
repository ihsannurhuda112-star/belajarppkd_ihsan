import 'package:flutter/material.dart';

class Test4 extends StatelessWidget {
  const Test4({super.key});

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
            color: const Color.fromARGB(255, 255, 255, 255),
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
          SizedBox(height: 5),
          Divider(height: 5),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Produk")],
            ),
          ),
          ListTile(
            tileColor: Colors.pinkAccent,
            leading: Image.asset("assets/images/tas.jpg"),
            title: Text(
              "Tas",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Rp.50.000"),
            trailing: Icon(Icons.more_horiz),
          ),
          SizedBox(height: 5),
          Divider(height: 5),
          ListTile(
            tileColor: Colors.blueAccent,
            leading: Image.asset("assets/images/kursi.jpg"),
            title: Text(
              "Kursi Gaming",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("RP 1.000.000"),
            trailing: Icon(Icons.more_horiz),
          ),
          SizedBox(height: 10),
          Divider(height: 10),
          ListTile(
            leading: Image.asset("assets/images/raja.jpg"),
            title: Text(
              "Kasur Raja",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("RP 10.000.000"),
            trailing: Icon(Icons.more_horiz),
          ),
          SizedBox(height: 10),
          Divider(height: 10),
          ListTile(
            leading: Image.asset("assets/images/emas.jpeg"),
            title: Text(
              "Iphone Messi",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("RP 100.000.000 (Juara Wc Dulu Yh)"),
            trailing: Icon(Icons.more_horiz),
          ),
          SizedBox(height: 10),
          Divider(height: 10),
          ListTile(
            leading: Image.asset("assets/images/messi.jpg"),
            title: Text(
              "Baju Messi",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("RP 999.999.999 (Ada tanda tangan goat)"),
            trailing: Icon(Icons.more_horiz_outlined),
          ),
        ],
      ),
    );
  }
}
