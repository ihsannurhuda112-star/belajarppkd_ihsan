import 'package:flutter/material.dart';

class ListviewListMapWidget extends StatefulWidget {
  const ListviewListMapWidget({super.key});

  @override
  State<ListviewListMapWidget> createState() => _ListviewListMapWidgetState();
}

class _ListviewListMapWidgetState extends State<ListviewListMapWidget> {
  final List<Map<String, dynamic>> namaMakananRingan = [
    {"name": "Taro", "price": 2000, "Icon": Icons.food_bank},
    {"name": "Lays", "price": 2000, "Icon": Icons.add_home_work_sharp},
    {"name": "Chiki balls", "price": 2000, "Icon": Icons.no_food_sharp},
    {"name": "Doritos", "price": 2000, "Icon": Icons.folder_copy_rounded},
    {"name": "qtela", "price": 6000, "Icon": Icons.face},
    {"name": "Kusuka", "price": 2000, "Icon": Icons.qr_code},
    {"name": "Pota bee", "price": 4500, "Icon": Icons.add_alert_rounded},
    {"name": "Chitato", "price": 3000, "Icon": Icons.access_time_outlined},
    {"name": "Kris bee", "price": 4000, "Icon": Icons.add_card},
    {"name": "French Fries", "price": 5000, "Icon": Icons.account_circle},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SNACK")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Text("List Makanan"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: namaMakananRingan.length,
              itemBuilder: (BuildContext context, int index) {
                final item = namaMakananRingan[index];
                return ListTile(
                  leading: Icon(item['Icon']),
                  title: Text(item["name"]),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Kamu memilih ${item["name"]}")),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
