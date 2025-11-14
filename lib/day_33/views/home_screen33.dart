import 'package:belajarppkd_ihsan/day_33/models/profile.dart';
import 'package:belajarppkd_ihsan/day_33/views/edit_profile_screen33.dart';
import 'package:flutter/material.dart';
import 'package:belajarppkd_ihsan/day_33/service/api.dart';
import 'package:belajarppkd_ihsan/preferences/preference_handler.dart';

class HomeScreen33Widget extends StatefulWidget {
  const HomeScreen33Widget({super.key});

  @override
  State<HomeScreen33Widget> createState() => _HomeScreen33WidgetState();
}

class _HomeScreen33WidgetState extends State<HomeScreen33Widget> {
  bool isLoading = true;
  GetProfileModel? profile;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    final token = await PreferenceHandler.getToken();

    try {
      final result = await AuthAPI.getProfile(token: token);
      setState(() {
        profile = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : profile == null
          ? const Center(child: Text("Gagal memuat profile"))
          : buildContent(),
    );
  }

  Widget buildContent() {
    final user = profile!.data;

    return Column(
      children: [
        buildHeader(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: buildProfileCard(user),
        ),
      ],
    );
  }

  /// TOP GRADIENT HEADER
  Widget buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 50),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6D5DFB), Color(0xFF8E78FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: const Center(
        child: Text(
          "Welcome Back 👋",
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  /// PROFILE CARD
  Widget buildProfileCard(Data? user) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar
          const CircleAvatar(
            radius: 45,
            backgroundColor: Color(0xFF6D5DFB),
            child: Icon(Icons.person, size: 55, color: Colors.white),
          ),

          const SizedBox(height: 18),

          // Name
          Text(
            user?.name ?? "-",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),

          const SizedBox(height: 6),

          // Email
          Text(
            user?.email ?? "-",
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
          ),

          const SizedBox(height: 25),

          // Edit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6D5DFB),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
              child: const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
