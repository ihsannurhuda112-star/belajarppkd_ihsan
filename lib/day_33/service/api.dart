import 'dart:convert';
import 'dart:developer';

import 'package:belajarppkd_ihsan/day_33/constant/endpoint.dart';
import 'package:belajarppkd_ihsan/day_33/models/login.dart';
import 'package:belajarppkd_ihsan/day_33/models/profile.dart';
import 'package:belajarppkd_ihsan/day_33/models/register.dart';
import 'package:belajarppkd_ihsan/preferences/preference_handler.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthAPI {
  static Future<RegisterModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoitn.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<LoginModel33> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoitn.login);

    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      // Login berhasil, balikan model
      return LoginModel33.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<GetProfileModel> getProfile({required String token}) async {
    final url = Uri.parse(Endpoitn.profile);

    final response = await http.get(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return GetProfileModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<GetProfileModel> updateProfile({
    required String name,
    required String email,
  }) async {
    final token = await PreferenceHandler.getToken();

    final url = Uri.parse(Endpoitn.profile);

    final response = await http.put(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
      body: {"name": name, "email": email},
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return GetProfileModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }
}
