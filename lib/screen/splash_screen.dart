import 'dart:async';
import 'package:Safeplate/screen/BottomNavBar/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Safeplate/screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 3), () async {

      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userInfo = pref.getString('user_info');
      if (userInfo != null){
        Get.offAllNamed(HomeScreen.route);

      } else {
        Get.offAllNamed(OnBoardingScreen.route);
      }


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF75D051),
        body: Center(child: Image.asset('assets/images/splash.png'))
    );
  }
}
