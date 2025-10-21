import 'package:flutter/material.dart';

class PengingatWidget extends StatefulWidget {
  const PengingatWidget({super.key});

  @override
  State<PengingatWidget> createState() => _PengingatWidgetState();
}

class _PengingatWidgetState extends State<PengingatWidget> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Atur Timer")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              selectedTime == null
                  ? "Timer Belum Di Pilih"
                  : "Timer Di pilih pada : ${selectedTime!.format(context)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                setState(() {
                  selectedTime = picked;
                });
              }
            },
            child: const Text("Pilih Timer"),
          ),
        ],
      ),
    );
  }
}
