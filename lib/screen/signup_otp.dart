import 'dart:async';


import 'dart:developer';


import 'package:Safeplate/repo/resetotp_repo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../repo/signup_otp_repo.dart';
import '../repo/signup_resend_otp_repo.dart';
import '../repo/verify_otp_repo.dart';
import '../resources/dimension.dart';
import '../widget/helper.dart';
import 'login_screen.dart';

class SignupOtp extends StatefulWidget {
  const SignupOtp({super.key});

  static var route = "/SignupOTP";

  @override
  State<SignupOtp> createState() => _SignupOtpState();
}

class _SignupOtpState extends State<SignupOtp> {
  String text = '';
  final _formKey1 = GlobalKey<FormState>();
  RxBool hasError1 = false.obs;
  RxInt countdown = 0.obs;
  Timer? _timer;


  TextEditingController otpController =  TextEditingController();

  bool apiLoading = false;
  void startTimer() {
    countdown.value = 60; // 1 minute countdown
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        _timer?.cancel();
      }
    });
  }
  resendOtp() {
    startTimer();
    signupresetOtpRepo(email: text,type:"emailverifyotp" ,context: context).then((value) async {
      if (value.success == true) {
        showToast("${value.message}");
        startTimer();
      } else {
        showToast(value.message);
      }
      return;
    });

    log('OTP resent');
  }



  void initState() {
    // TODO: implement initState
    super.initState();
    text = Get.arguments[0];
    print("text${text}");

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody:false,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Forgot Password.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: (){
                  print("bnhvcjkwehfew");
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.black, size: 22),
                      SizedBox(width: 8), // Add some spacing between the icon and text
                      Text(
                        "Sign Up Verify Otp",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AddSize.padding20),
                margin: EdgeInsets.only(top: AddSize.size30),
                decoration: const BoxDecoration(
                  color: Color(0xff75D051),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Form(
                  // key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 30),
                      child: Form(
                        key: _formKey1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Sign Up Verify Otp",
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: AddSize.size14,
                            ),
                            Text(
                              "Enter the verification code we just sent you on your email address.",
                              style: GoogleFonts.roboto(
                                height: 1.5,
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: AddSize.size40,
                            ),
                            Obx(() {
                              return PinCodeTextField(
                                controller: otpController,

                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                cursorColor: Colors.black,
                                appContext: context,
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                pastedTextStyle: TextStyle(
                                  color: Colors.green.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                                animationType: AnimationType.fade,
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return "";
                                  } else if (v.length != 4) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                length: 4,
                                pinTheme: PinTheme(
                                  selectedColor: Colors.white,
                                  activeColor: Colors.white,
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(6),
                                  fieldWidth: AddSize.size30 * 2.3,
                                  fieldHeight: AddSize.size30 * 1.8,
                                  borderWidth: 1,
                                  inactiveColor: !hasError1.value
                                      ? Colors.white
                                      : Colors.red,
                                  errorBorderColor: Colors.red,
                                  inactiveFillColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                  activeFillColor: Colors.white,
                                  // fieldOuterPadding:
                                  // EdgeInsets.symmetric(horizontal: 5),
                                ),
                                enableActiveFill: true,
                                keyboardType: TextInputType.number,
                                onChanged: (v) {
                                  if (v.length == 4) {
                                    hasError1.value = false;
                                  }
                                },
                              );
                            }),

                            Align(
                              alignment: Alignment.centerRight,
                              child: Obx(() {
                                return RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: 'If You Don’t Receive A Code!  '),
                                      TextSpan(
                                        text: countdown.value == 0
                                            ? 'Resend'
                                            : '${countdown.value}s',
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: countdown.value == 0?
                                            Color(0xffFBB742):Colors.black

                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            if (countdown.value == 0) {
                                              resendOtp();
                                            }
                                          },
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              height: AddSize.size60,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  if (apiLoading) return;
                                  apiLoading = true;
                            if(_formKey1.currentState!.validate()){
                              try {
                                signupOTPRepo(
                                  email: text,
                                  otp: otpController.text,
                                  context: context,
                                )
                                    .then((value1) async {
                                  if (value1.success == true) {
                                    showToast(value1.message.toString());
                                    Get.offAllNamed(LoginScreen.route);
                                  } else {
                                    showToast(value1.message.toString());
                                  }
                                  apiLoading = false;
                                }
                                );
                              } catch (e) {
                                apiLoading = false;
                              }
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
                                child: Text("Verify".toUpperCase(),
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: 20))),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



