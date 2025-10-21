import 'package:belajarppkd_ihsan/day%2015/end.dart';
import 'package:belajarppkd_ihsan/day%2015/login_button.dart';
import 'package:belajarppkd_ihsan/tugasday_10/test4.dart';

import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: LoginButtonWidget(
              text: "Keluar",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.all(8),
            child: Center(
              child: LoginButtonWidget(
                text: "Pindah test4",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Test4()),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.all(8),
            child: Center(
              child: LoginButtonWidget(
                text: "Akhir",
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => End()),
                    (route) => false,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
