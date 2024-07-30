import 'dart:async';
import 'package:Safeplate/repo/resetotp_repo.dart';
import 'package:Safeplate/repo/verify_otp_repo.dart';
import 'package:Safeplate/resources/dimension.dart';
import 'package:Safeplate/screen/BottomNavBar/home.dart';
import 'package:Safeplate/screen/changepassword_screen.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static var route = "/verifyOtpScreen";


  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
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
    resetOtpRepo(email: text, context: context).then((value) async {
      if (value.success == true) {
        showToast("${value.message}");
        startTimer();
      } else {
        showToast(value.message);
      }
      return;
    });
    // Implement your OTP resend logic here
    print('OTP resent');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    text = Get.arguments[0];

  }
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Verify Otp",
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
                    key: _formKey1,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AddSize.size30,
                          ),
                          Text(
                            "Verify OTP",
                            style: GoogleFonts.roboto(
                              fontSize: 22,
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
                              height: 1.8,
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
                                  return "please enter otp";
                                } else if (v.length != 4) {
                                  return "please enter otp";
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
                                    VerifyOtpRepo(
                                      email: text,
                                      otp: otpController.text,
                                        context: context,)
                                        .then((value1) async {
                                      if (value1.success == true) {
                                        showToast(value1.message.toString());
                                        Get.offAllNamed(ChangePassword.route);
                                      } else {
                                        showToast(value1.message.toString());
                                      }
                                      apiLoading = false;
                                    });
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
          ],
        ),
      ),
    );
  }
}
