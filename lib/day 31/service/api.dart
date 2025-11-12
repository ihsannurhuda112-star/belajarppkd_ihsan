import 'dart:convert';
import 'package:belajarppkd_ihsan/day%2031/models/game_of_thornes.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://thronesapi.com/api/v2/Characters";

  /// Ambil semua karakter
  Future<List<GameOfThornes>> getAllCharacters() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => GameOfThornes.fromJson(e)).toList();
    } else {
      throw Exception(
        "Failed to load characters (Status: ${response.statusCode})",
      );
    }
  }

  /// Ambil karakter berdasarkan nama house
  Future<List<GameOfThornes>> getCharactersByHouse(String house) async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final allCharacters = jsonData
          .map((e) => GameOfThornes.fromJson(e))
          .toList();

      if (house == "All") return allCharacters;

      // Filter hanya karakter dengan family yang cocok
      return allCharacters
          .where((c) => c.family?.toLowerCase() == house.toLowerCase())
          .toList();
    } else {
      throw Exception("Failed to load characters by house");
    }
  }
}
