import 'package:flutter/material.dart';

class PendaftaranWidget extends StatefulWidget {
  const PendaftaranWidget({super.key, required this.name, required this.dom});
  final String name;
  final String dom;

  @override
  State<PendaftaranWidget> createState() => _PendaftaranWidgetState();
}

class _PendaftaranWidgetState extends State<PendaftaranWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Thanks\n ${widget.name},from\n ${widget.dom}\n for registration",
            ),
          ],
        ),
      ),
    );
  }
}
