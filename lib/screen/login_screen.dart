import 'dart:io';
import 'package:Safeplate/repo/login_repo.dart';
import 'package:Safeplate/resources/dimension.dart';
import 'package:Safeplate/screen/BottomNavBar/bottomnavbar.dart';
import 'package:Safeplate/screen/forgot_screen.dart';
import 'package:Safeplate/screen/signup_otp.dart';
import 'package:Safeplate/screen/signup_screen.dart';
import 'package:Safeplate/widget/custom_textfield.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../repo/signup_resend_otp_repo.dart';

import '../repo/signup_resend_otp_repo.dart';


String? mail;
String? name;


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static var route = "/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var obscureText1 = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  String currentMessage = '';

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            height: 550.0, // Specify the height here
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Login.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AddSize.size30 * 2.5,
                // width:  AddSize.screenWidth,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AddSize.padding18),
                child: Text(
                  "Login",
                  style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff283841)),
                ),
              ),
              SizedBox(
                height: AddSize.size12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AddSize.padding16),
                child: SizedBox(
                  width: 320,
                  child: Text(
                    "Only features this provides is syncing across devices + community updates",
                    style: GoogleFonts.roboto(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff466148)),
                  ),
                ),
              ),
              // SizedBox(
              //   height: AddSize.size30,
              // ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * .76,
                  // padding: EdgeInsets.symmetric(horizontal: AddSize.padding18),
                  // margin: EdgeInsets.only(top: AddSize.size30),
                  decoration: const BoxDecoration(
                      color: Color(0xff75D051),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey1,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: AddSize.padding18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            currentMessage == ""
                                ? SizedBox()
                                : Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'You are not verify ? ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: 'poppinsSans',
                                    color: Color(0xFF333848),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            signupresetOtpRepo(
                                                email: emailController.text,
                                                type: "emailverifyotp",
                                                context: context)
                                                .then((value) async {
                                              if (value.success == true) {
                                                showToast(
                                                    "${value.message}");
                                                Get.toNamed(
                                                    SignupOtp.route,arguments: [emailController.text.toString()]);
                                              } else {
                                                showToast(value.message);
                                              }
                                              return;
                                            });
                                          },
                                        text: 'Resend OTP',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.redAccent)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Email",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Color(0xffFAFAFA),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: AddSize.size12,
                            ),
                            CommonTextFieldWidget(
                              textInputAction: TextInputAction.next,
                              hint: 'Enter Your Email',
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              // ],
                              validator: (value) {
                                if (value!.isEmpty || RegExp(r'\s').hasMatch(value)) {
                                  return "Email is required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: AddSize.size25,
                            ),
                            Text(
                              "Password",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: const Color(0xffFAFAFA),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: AddSize.size12,
                            ),
                            CommonTextFieldWidget(
                              textInputAction: TextInputAction.next,
                              controller: passwordController,
                              obscureText: obscureText1,
                              keyboardType: TextInputType.name,
                              hint: 'Enter Your Password',
                              suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText1 = !obscureText1;
                                    });
                                  },
                                  child: obscureText1
                                      ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                      : const Icon(
                                    Icons.visibility,
                                    color: Color(0xFF53B176),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password is required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: AddSize.size20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(ForgotScreen.route);
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFEAB1D)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: AddSize.size45,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  mail=emailController.text;

                                  // if (_formKey1.currentState!.validate()) {
                                  //   login();
                                  // }else{
                                  //   showToast("something is went wrong");
                                  // }

                                  if (_formKey1.currentState!.validate()) {
                                    loginRepo(
                                        email: emailController.text,
                                        password: passwordController.text,

                                        context: context
                                    )
                                        .then(
                                            (value) async {
                                          if (value.success == true) {
                                            print("AAAAAAAAAAAAAA${name.toString()}");
                                            //name=value.data!.name.toString();
                                            SharedPreferences pref = await SharedPreferences.getInstance();
                                            pref.setString("cookie", jsonEncode(value.accessToken));
                                            pref.setString("email", jsonEncode(value.data!.email));
                                            pref.setString("name", jsonEncode(value.data!.name));
                                            pref.setString("refreshToken", jsonEncode(value.refreshtoken));
                                            // pref.setString("user_info", jsonEncode(value.accessToken));
                                            // prefs.setString('token', value.accessToken.toString());
                                            // final prefs = await SharedPreferences.getInstance();
                                            // await prefs.setString('token', value.accessToken.toString());
                                            showToast(value.message);
                                            print("tojkenmy =>${value.accessToken.toString()}");
                                            Get.toNamed(BottomNavbar.route,);
                                          }       else if(value.success==false){

                                            showToast(value.message);
                                            if(value.message=="Please verify your email to continue"){
                                              currentMessage=value.message!;
                                              setState(() {

                                              });
                                            }
                                          }
                                        });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize:
                                  Size(AddSize.screenWidth, AddSize.size50),
                                  backgroundColor: Color(0xffFBB742),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                child: Text("Login".toUpperCase(),
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: 20))),
                            SizedBox(height: AddSize.size40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xffF3F0EB),
                                  ),
                                ),
                                SizedBox(
                                  width: AddSize.size25,
                                ),
                                const Expanded(
                                    child: Text("Or Login With",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 14))),
                                const Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xffF3F0EB),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AddSize.size40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // signInFaceBook();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 35,
                                        vertical: AddSize.padding12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Image(
                                          image: const AssetImage(
                                              "assets/icons/fb.png")),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: AddSize.size22,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // signInWithGoogle();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 35,
                                        vertical: AddSize.padding12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Image(
                                          image: const AssetImage(
                                              "assets/icons/google.png")),
                                    ),
                                  ),
                                ),
                                Platform.isIOS
                                    ? GestureDetector(
                                  onTap: () {
                                    // loginWithApple();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AddSize.size40,
                                        vertical: AddSize.padding10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Image(
                                          height: AddSize.size20,
                                          width: AddSize.size30,
                                          image: const AssetImage(
                                              "   assets/icons/apple.png")),
                                    ),
                                  ),
                                )
                                    : const SizedBox()
                              ],
                            ),
                            SizedBox(
                              height: AddSize.size60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.end,
                                  textDirection: TextDirection.rtl,
                                  softWrap: true,
                                  maxLines: 1,
                                  textScaleFactor: 1,
                                  text: TextSpan(
                                    text: 'Don’t have an account? ',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Sign up',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffFBB742),
                                          fontSize: 18,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle the navigation
                                            Get.toNamed(SignUpScreen.route);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AddSize.size40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

// void login() async {
//   final url = Uri.parse('https://safegate.virtualdemo.tech/api/v1/login');
//   final headers = {
//     'Content-Type': 'application/json',
//     // 'Cookie': 'connect.sid=s%3Ak6nhc_76OKSswNfV8zhdyQ5qjlhRk308.uIkd%2FeX97K2NoPPe%2Bhi1PiM7uKpDLqtljdyIKteCrgY'
//   };
//   final body = jsonEncode(
//       {'email': emailController.text, 'password': passwordController.text});
//
//   final response = await http.post(url, headers: headers, body: body);
//
//   try {
//     if (response.statusCode == 200) {
//       print('Login successful');
//       Get.toNamed(
//         BottomNavbar.route,
//       );
//       final data =jsonDecode(response.body);
//       showToast(data['message']);
//     } else {
//       final data =jsonDecode(response.body);
//       final saveData = data;
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       pref= data['message'];
//       showToast(data['message']);
//       print('Login failed${pref.toString()}');
//       print('Status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//     }
//   } catch (e) {
//
//     showToast('error');
//   }
// }
}
