import 'package:belajarppkd_ihsan/day%2017/login_screen.dart';
import 'package:belajarppkd_ihsan/day%2019/database/db_helper.dart';
import 'package:belajarppkd_ihsan/day%2019/model/citizen_model.dart';
import 'package:belajarppkd_ihsan/preferences/preference_handler.dart';
import 'package:flutter/material.dart';

class Rumah extends StatefulWidget {
  const Rumah({
    super.key,
    required this.email,
    required this.name,
    required this.age,
  });
  final String email;
  final String name;
  final String age;
  @override
  State<Rumah> createState() => _RumahState();
}

class _RumahState extends State<Rumah> {
  @override
  Widget build(BuildContext context) {
    // final args =
    // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final nama = args['nama'];
    // final email = args['email'];w
    // final kelas = args['kelas'];

    return Scaffold(
      appBar: AppBar(title: Text('Halo ${widget.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Selamat Datang!", style: TextStyle(fontSize: 24)),
              const SizedBox(height: 10),
              const Text("Berikut adalah informasi Anda:"),
              Text("Nama: ${widget.name}"),
              Text("Email: ${widget.email}"),
              SizedBox(height: 30),
              FutureBuilder(
                future: DbHelper.getAllCitizen(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (!snapshot.hasData ||
                      (snapshot.data as List).isEmpty) {
                    return const Center(child: Text("Tidak ada data"));
                  } else {
                    final data = snapshot.data as List<CitizenModel>;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final items = data[index];
                          return Column(
                            children: [
                              ListTile(
                                title: Text(items.name),
                                subtitle: Text(items.email),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  PreferenceHandler.removeLogin();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreenWidget(),
                    ),
                    (route) => false,
                  );
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
