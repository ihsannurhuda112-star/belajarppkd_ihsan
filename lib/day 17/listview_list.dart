import 'package:flutter/material.dart';

class ListviewListWidget extends StatefulWidget {
  const ListviewListWidget({super.key});

  @override
  State<ListviewListWidget> createState() => _ListviewListWidgetState();
}

class _ListviewListWidgetState extends State<ListviewListWidget> {
  final List<String> namaMakananRingan = [
    "Taro",
    "Lays",
    "Chiki Balls",
    "Doritos",
    "Qtela",
    "Kusuka",
    "Pota bee",
    "Chitato",
    "Kris bee",
    "French fries",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaMakananRingan.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(namaMakananRingan[index]));
      },
    );
  }
}
