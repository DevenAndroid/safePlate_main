import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Safeplate/routers/routers.dart';
import 'package:Safeplate/screen/login_screen.dart';
import 'package:Safeplate/screen/onboarding_screen.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () async {
        Get.offAllNamed(OnBoardingScreen.route);


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
