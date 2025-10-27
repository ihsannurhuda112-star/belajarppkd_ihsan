import 'package:belajarppkd_ihsan/sopday19/database/database/db_helper1.dart';
import 'package:belajarppkd_ihsan/sopday19/database/model/citizen_model1.dart';
import 'package:belajarppkd_ihsan/soptugas11/model/citizen_model2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Tugas11Flutter2 extends StatefulWidget {
  const Tugas11Flutter2({super.key});

  @override
  State<Tugas11Flutter2> createState() => _Tugas11Flutter2State();
}

class _Tugas11Flutter2State extends State<Tugas11Flutter2> {
  final nameC = TextEditingController();
  final ageC = TextEditingController();
  final emailC = TextEditingController();
  getData() {
    DbHelper.getAllCitizen();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                "Selamat Datang!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name:", style: TextStyle(fontSize: 16)),
                    buildUserInput(hint: 'Name', controller: nameC),
                    Text("Age:", style: TextStyle(fontSize: 16)),
                    buildUserInput(hint: 'Umur', controller: ageC),
                    Text("email:", style: TextStyle(fontSize: 16)),
                    buildUserInput(hint: 'masukan email', controller: emailC),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(80, 40),
                  backgroundColor: Colors.lightBlueAccent,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
                  ),
                ),
                onPressed: () {
                  if (nameC.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Nama belum diisi");
                  } else if (ageC.text.isEmpty) {
                    Fluttertoast.showToast(msg: "umur belum diisi");
                  } else if (emailC.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Email belum diisi");
                  } else {
                    final CitizenModel1 dataPublic = CitizenModel1(
                      name: nameC.text,
                      email: emailC.text,
                      age: int.parse(ageC.text),
                    );
                    DbHelper.registerCitizen(dataPublic).then((value) {
                      setState(() {});
                      nameC.clear();
                      emailC.clear();
                      ageC.clear();
                    });
                  }
                },
                child: Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(height: 40),
              FutureBuilder(
                future: DbHelper.getAllCitizen(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    final data = snapshot.data as List<CitizenModel2>;
                    return Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final items = data[index];
                          return Column(
                            children: [
                              ListTile(
                                title: Text(items.name),
                                subtitle: Text(items.id.toString()),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildUserInput({
    String? hint,
    TextEditingController? controller,
    String? Function(String?)? validator,
    bool isNumber = false,
  }) {
    return TextFormField(
      keyboardType: isNumber ? TextInputType.number : null,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
    );
  }
}
