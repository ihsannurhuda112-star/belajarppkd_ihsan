import 'package:belajarppkd_ihsan/day%2031/view/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:belajarppkd_ihsan/constant.dart/app_images.dart';

class SplashScreen31 extends StatefulWidget {
  const SplashScreen31({super.key});

  @override
  State<SplashScreen31> createState() => _SplashScreen31State();
}

class _SplashScreen31State extends State<SplashScreen31> {
  @override
  void initState() {
    super.initState();
    _navigateToCharacterScreen();
  }

  void _navigateToCharacterScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CharacterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // gambar isi seluruh layar
        children: [
          // Gambar background fullscreen
          Image.asset(
            AppImages.game,
            fit: BoxFit.cover, // isi seluruh layar tanpa ruang kosong
          ),

          //  Overlay agar teks dan loader tetap jelas
          Container(color: Colors.black.withOpacity(0.4)),

          // Konten di tengah
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 16),
                CircularProgressIndicator(color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
