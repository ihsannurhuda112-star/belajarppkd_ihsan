import 'package:belajarppkd_ihsan/day%2015/home_screen.dart';
import 'package:belajarppkd_ihsan/day13/tugasflutter6.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    //Center(child: Text("Home"),)
    HomeScreenWidget(),
    Tugasflutter6(),
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
      appBar: AppBar(title: Text("Laci")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sun.jpeg'),
              ),
              title: Text("admin"),
              subtitle: Text("Keren"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.home),
              title: Text("Rumah"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.payment),
              title: Text("Hebat"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
