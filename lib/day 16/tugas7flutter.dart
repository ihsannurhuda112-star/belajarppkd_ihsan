import 'package:belajarppkd_ihsan/day%2016/cekbox.dart';
import 'package:belajarppkd_ihsan/day%2016/lahir.dart';
import 'package:belajarppkd_ihsan/day%2016/modegelap.dart';
import 'package:belajarppkd_ihsan/day%2016/pengingat.dart';
import 'package:belajarppkd_ihsan/day%2016/produk.dart';
import 'package:flutter/material.dart';

class Tugas7flutterWidget extends StatefulWidget {
  const Tugas7flutterWidget({super.key});

  @override
  State<Tugas7flutterWidget> createState() => _Tugas7flutterWidgetState();
}

class _Tugas7flutterWidgetState extends State<Tugas7flutterWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    CekboxWidget(),
    ModegelapWidget(),
    ProdukWidget(),
    LahirWidget(),
    PengingatWidget(),
  ];
  void onTapDrawer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas Flutter 7")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sun.jpeg'),
              ),
              title: Text("Sung Jin-Woo"),
              subtitle: Text("shadow monarch"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.home),
              title: Text("daftar"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.dark_mode),
              title: Text("Gelap"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.production_quantity_limits),
              title: Text("Produk"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.access_time),
              title: Text("Waktu"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              leading: Icon(Icons.timer_sharp),
              title: Text("Timer"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
