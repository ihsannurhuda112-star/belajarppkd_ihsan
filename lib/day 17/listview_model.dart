import 'package:belajarppkd_ihsan/constant.dart/app_images.dart';
import 'package:belajarppkd_ihsan/day%2017/models/snack_model.dart';
import 'package:belajarppkd_ihsan/extension/rupiah.dart';
import 'package:flutter/material.dart';

class ListviewModelWidget extends StatefulWidget {
  const ListviewModelWidget({super.key});

  @override
  State<ListviewModelWidget> createState() => _ListviewModelWidgetState();
}

class _ListviewModelWidgetState extends State<ListviewModelWidget> {
  final List<SnackModel> namaSnack = [
    SnackModel(
      name: "Taro",
      price: 5000,
      condition: "max",
      backgroundColor: Colors.black,
      image: AppImages.taro,
    ),
    SnackModel(
      name: "Lays",
      price: 5000,
      condition: "good",
      backgroundColor: Colors.blue,
      image: AppImages.lays,
    ),
    SnackModel(
      name: "chikiballs",
      price: 5000,
      condition: "low",
      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.chikiballs,
    ),
    SnackModel(
      name: "doritos",
      price: 5000,
      condition: "medium",
      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.doritos,
    ),
    SnackModel(
      name: "kusuka",
      price: 5000,
      condition: "max",
      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.kusuka,
    ),
    SnackModel(
      name: "potabee",
      price: 5000,
      condition: "good",
      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.potabee,
    ),
    SnackModel(
      name: "chitato",
      price: 5000,
      condition: "max",
      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.chitato,
    ),
    SnackModel(
      name: "krisbee",
      price: 5000,
      condition: "medium",
      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.krisbee,
    ),
    SnackModel(
      name: "frenchfries",
      price: 5000,
      condition: "bad",
      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.frenchfries,
    ),
    SnackModel(
      name: "qtela",
      price: 5000,
      condition: "good",
      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.qtela,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Model")),
      body: ListView.builder(
        itemCount: namaSnack.length,
        itemBuilder: (BuildContext context, int index) {
          final item = namaSnack[index];
          return ListTile(
            leading: Image.asset(item.image, width: 60),
            title: Text(item.name),
            subtitle: Text(item.price.toString().toRPCurrency()),
          );
        },
      ),
    );
  }
}
