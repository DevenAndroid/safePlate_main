// import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:Safeplate/google_ml_kit.dart';
import 'package:Safeplate/image_gemini.dart';
import 'package:Safeplate/screen/BottomNavBar/bottomnavbar.dart';
import 'package:Safeplate/screen/BottomNavBar/home.dart';
import 'package:Safeplate/screen/BottomNavBar/profile_screen.dart';
import 'package:Safeplate/screen/Notification_screen.dart';
import 'package:Safeplate/screen/PrivacySecurity_screen.dart';
import 'package:Safeplate/screen/settings/add_familymember_screen.dart';
import 'package:Safeplate/screen/changepassword_screen.dart';
import 'package:Safeplate/screen/chat_screen/chat_screen.dart';
import 'package:Safeplate/screen/forgot_screen.dart';
import 'package:Safeplate/screen/home/setting.dart';
import 'package:Safeplate/screen/login_screen.dart';
import 'package:Safeplate/screen/onboarding_screen.dart';
import 'package:Safeplate/screen/scan/scan.dart';
import 'package:Safeplate/screen/signup_otp.dart';
import 'package:Safeplate/screen/signup_screen.dart';
import 'package:Safeplate/screen/splash_screen.dart';
import 'package:Safeplate/screen/termscondition_screen.dart';
import 'package:Safeplate/screen/verifyotp_screen.dart';
import 'package:get/get.dart';

import '../screen/chat_screen.dart';

class MyRouter {
  static var splashScreen = "/splashScreen";
  static var route = [
  GetPage(name: '/', page: () =>   SplashScreen()),
    GetPage(name: OnBoardingScreen.route, page: () => const OnBoardingScreen()),
    GetPage(name: ForgotScreen.route, page: () => const ForgotScreen()),
    GetPage(name: LoginScreen.route, page: () => const LoginScreen()),
    GetPage(name: SignUpScreen.route, page: () => const SignUpScreen()),
    GetPage(name: SignupOtp.route, page: () => const SignupOtp()),
    GetPage(name: VerifyOtpScreen.route, page: () => const VerifyOtpScreen()),
    GetPage(name: ChangePassword.route, page: () => const ChangePassword()),
    GetPage(name: HomeScreen.route, page: () => const HomeScreen()),
    GetPage(name: SettingScreen.route, page: () => const SettingScreen()),
    GetPage(name: PrivacyPolicy.route, page: () => const PrivacyPolicy()),
    GetPage(name: TermCondition.route, page: () => const TermCondition()),
    GetPage(name: AddFamilyMember.route, page: () => const AddFamilyMember()),

    GetPage(name: NotificationScreen.route, page: () => const NotificationScreen()),
    GetPage(name: ProfileScreen.route, page: () => const ProfileScreen()),
    GetPage(name: AddFamilyMember.route, page: () => const AddFamilyMember()),
    GetPage(name: SacanScreen.route, page: () => const SacanScreen()),
    GetPage(name: BottomNavbar.route, page: () => const BottomNavbar()),
    GetPage(name: ChatScreen.route, page: () =>  ChatScreen()),

  ];
}