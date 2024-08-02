import 'package:Safeplate/routers/routers.dart';
import 'package:Safeplate/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return OverlaySupport.global(
      child: GetMaterialApp(
        title: 'Safeplate Application',
        theme: ThemeData(
            fontFamily: 'Roboto',
            primarySwatch: Colors.green,
            useMaterial3: false
        ),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
         initialRoute: "/",
        getPages:MyRouter.route,
      ),
    );
  }
}
