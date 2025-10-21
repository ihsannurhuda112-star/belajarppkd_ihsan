import 'package:flutter/material.dart';

class ProdukWidget extends StatefulWidget {
  const ProdukWidget({super.key});

  @override
  State<ProdukWidget> createState() => _ProdukWidgetState();
}

class _ProdukWidgetState extends State<ProdukWidget> {
  String? Produk;
  final List<String> listBarang = ["Elektronik", "Pakaian", "Makanan"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Pilih Katergori Produk"),
        DropdownButton(
          value: Produk,
          items: listBarang.map((String val) {
            return DropdownMenuItem(
              value: val,
              child: Text(val, style: TextStyle(color: Colors.black)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              Produk = value;
            });
            print(Produk);
          },
        ),
        Container(
          width: double.infinity,
          height: 100,
          color: Produk == "Pakaian"
              ? Colors.cyan
              : Produk == "Elektronik"
              ? Colors.tealAccent
              : Colors.blueGrey,
        ),
        Text("Anda memilih : $Produk"),
      ],
    );
  }
}
