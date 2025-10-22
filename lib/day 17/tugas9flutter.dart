import 'package:belajarppkd_ihsan/day%2017/listview_list.dart';
import 'package:belajarppkd_ihsan/day%2017/listview_list_map.dart';
import 'package:belajarppkd_ihsan/day%2017/listview_model.dart';
import 'package:flutter/material.dart';

class Tugas9flutterWidget extends StatefulWidget {
  const Tugas9flutterWidget({super.key});

  @override
  State<Tugas9flutterWidget> createState() => _Tugas9flutterWidgetState();
}

class _Tugas9flutterWidgetState extends State<Tugas9flutterWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    ListviewListWidget(),
    ListviewListMapWidget(),
    ListviewModelWidget(),
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
              leading: Icon(Icons.food_bank),
              title: Text("snack"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.dark_mode),
              title: Text("Chiki"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.production_quantity_limits),
              title: Text("Produk"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
