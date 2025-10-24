import 'package:belajarppkd_ihsan/day%2019/model/citizen_model.dart';
import 'package:belajarppkd_ihsan/day%2019/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DbHelper {
  static const tableUser = 'users';
  static const tableCitizen = 'citizen';
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'rtdigital.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tableUser(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT)",
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (newVersion == 2) {
          await db.execute(
            "CREATE TABLE $tableCitizen(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, age int)",
          );
        }
      },

      version: 2,
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    //cat: insert fungsi menambahkan data (create)
    await dbs.insert(
      tableUser,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    //cat query adalah fungsi untuk meanmpilkan data (READ)
    final List<Map<String, dynamic>> results = await dbs.query(
      tableUser,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }

  // tambahin warga
  static Future<void> createCitizen(CitizenModel citizen) async {
    final dbs = await db();
    //insert fungsi untuk menambahkan data (CREATE)
    await dbs.insert(
      tableCitizen,
      citizen.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(citizen.toMap());
  }

  // get citizen
  static Future<List<CitizenModel>> getAllStudent() async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(tableCitizen);
    print(results.map((e) => CitizenModel.fromMap(e)).toList());
    return results.map((e) => CitizenModel.fromMap(e)).toList();
  }
}
