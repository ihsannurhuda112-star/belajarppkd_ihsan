import 'package:belajarppkd_ihsan/constant.dart/app_images.dart';
import 'package:belajarppkd_ihsan/day%2015/home_screen.dart';
import 'package:belajarppkd_ihsan/day_33/views/login_screen.dart';
import 'package:belajarppkd_ihsan/preferences/preference_handler.dart';
import 'package:flutter/material.dart';

class SplashScreen33 extends StatefulWidget {
  const SplashScreen33({super.key});

  @override
  State<SplashScreen33> createState() => _SplashScreen33State();
}

class _SplashScreen33State extends State<SplashScreen33> {
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
          MaterialPageRoute(builder: (context) => HomeScreenWidget()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen33()),
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
          Center(child: Image.asset(AppImages.chitato)),
          Text(
            "Taro",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
