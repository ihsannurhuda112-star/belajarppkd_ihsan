import 'package:belajarppkd_ihsan/day%2016/admin.dart';
import 'package:belajarppkd_ihsan/day%2016/tugas7flutter.dart';
import 'package:flutter/material.dart';

class TombolWidget extends StatefulWidget {
  const TombolWidget({super.key});

  @override
  State<TombolWidget> createState() => _TombolWidgetState();
}

class _TombolWidgetState extends State<TombolWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    Tugas7flutterWidget(),
    AdminWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.person)),
            label: 'Tentang Admin',
          ),
        ],
      ),
    );
  }
}
