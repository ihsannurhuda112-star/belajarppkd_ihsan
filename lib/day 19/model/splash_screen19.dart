import 'package:belajarppkd_ihsan/constant.dart/app_images.dart';
import 'package:belajarppkd_ihsan/day%2015/drawer.dart';
import 'package:belajarppkd_ihsan/day%2017/login_screen.dart';
import 'package:belajarppkd_ihsan/preferences/preference_handler.dart';
import 'package:flutter/material.dart';

class SplashScreenDay19 extends StatefulWidget {
  const SplashScreenDay19({super.key});

  @override
  State<SplashScreenDay19> createState() => _SplashScreenDay19State();
}

class _SplashScreenDay19State extends State<SplashScreenDay19> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();
      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DrawerWidget()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreenWidget()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppImages.taro)),
          Text(
            "Apel Apps",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
