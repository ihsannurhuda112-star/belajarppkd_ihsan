import 'package:belajarppkd_ihsan/day%2019/database/db_helper.dart';
import 'package:belajarppkd_ihsan/day%2019/model/citizen_model.dart';
import 'package:belajarppkd_ihsan/day%2019/model/login_screen_19.dart';
import 'package:belajarppkd_ihsan/preferences/preference_handler.dart';
import 'package:flutter/material.dart';

class ListCitizenPage extends StatefulWidget {
  const ListCitizenPage({super.key});

  @override
  State<ListCitizenPage> createState() => _ListCitizenPageState();
}

class _ListCitizenPageState extends State<ListCitizenPage> {
  getData() {
    DbHelper.getAllCitizen();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("List User")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("List data user:"),
          ),
          Expanded(
            child: FutureBuilder(
              future: DbHelper.getAllCitizen(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
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
                              title: Text(items.username),
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
          ),
          ElevatedButton(
            onPressed: () {
              PreferenceHandler.removeLogin();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreenDay19()),
                (route) => false,
              );
            },
            child: Text("LOG OUT"),
          ),
        ],
      ),
    );
  }
}
