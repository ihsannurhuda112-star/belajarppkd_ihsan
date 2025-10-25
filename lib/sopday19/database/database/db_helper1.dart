import 'package:belajarppkd_ihsan/sopday19/database/model/citizen_model1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static const tableCitizen = 'citizen';
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'citizen.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tableCitizen(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, age int)",
        );
      },
      version: 1,
    );
  }

  static Future<void> registerCitizen(CitizenModel1 public) async {
    final dbs = await db();
    await dbs.insert(
      tableCitizen,
      public.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<CitizenModel1>> getAllCitizen() async {
    final db = await DbHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('citizen');

    return List.generate(maps.length, (i) => CitizenModel1.fromMap(maps[i]));
  }
}
