import 'package:belajarppkd_ihsan/day%2015/home_screen.dart';
import 'package:belajarppkd_ihsan/day13/tugasflutter6.dart';
import 'package:belajarppkd_ihsan/tugasday_10/test4.dart';
import 'package:flutter/material.dart';

class NavigasiWidget extends StatefulWidget {
  const NavigasiWidget({super.key});

  @override
  State<NavigasiWidget> createState() => _NavigasiWidgetState();
}

class _NavigasiWidgetState extends State<NavigasiWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    //Center(child: Text("Home"),)
    HomeScreenWidget(),
    Tugasflutter6(),
    Test4(),
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
      appBar: AppBar(title: Text("Botom navigation")),
      body: _widgetOptions[_selectedIndex],
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
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.messenger_sharp)),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
