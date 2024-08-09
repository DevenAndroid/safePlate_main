 import 'package:Safeplate/routers/routers.dart';
import 'package:Safeplate/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pushy_flutter/pushy_flutter.dart';

 void main() async {
   WidgetsFlutterBinding.ensureInitialized();

   // Initialize the Pushy SDK
   Pushy.listen();

   // Set the App ID from Pushy Dashboard
   Pushy.setAppId('66b1fc0ca9865505291e5381');

   // Start the Pushy service and get the token
   String DeviceToken;
   try {
     DeviceToken = await Pushy.register();
     print('Device token: $DeviceToken');

     // Optionally send the token to your backend server
     // await sendTokenToServer(token);
   } catch (error) {
     print('Pushy registration error: $error');
   }

   runApp(MyApp());
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
