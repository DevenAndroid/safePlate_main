import 'package:Safeplate/repo/forgot_repo.dart';
import 'package:Safeplate/resources/dimension.dart';
import 'package:Safeplate/screen/verifyotp_screen.dart';
import 'package:Safeplate/widget/custom_textfield.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  static var route = "/forgotScreen";

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController emailController = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
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
                        "Forgot Password",
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
              // top: Get.height*0.50,

              child: Container(
                  // height: AddSize.size30 * 12,
                // height: AddSize.screenHeight,
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
                  key:_formKey1,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: Get.height*0.01
                          // ),
                          Text(
                            "Forgot Password",
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
                            "Enter the email address associated with your account.",
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
                          Text(
                            "Email",
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
                            hint: 'Enter Your Email',
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: AddSize.size80,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey1.currentState!.validate()) {
                                forgotRepo( context: context,
                                    email: emailController.text.toString(),
                                ).then((value) {
                                  if (value.success == true) {
                                    showToast(value.message);
                                    Get.toNamed(VerifyOtpScreen.route,arguments: emailController.text);
                                  } else {
                                    showToast(value.message);
                                  }
                                });
                              }
                              // forgotRepo(
                              //     context: context,
                              //     email: emailController.text
                              //         .toString())
                              //     .then((value) {
                              //   if (value.success == true) {
                              //     showToast(value.message);
                              //
                              //     Get.toNamed(VerifyOtpScreen.route,arguments: emailController.text);
                              //   } else {
                              //     showToast(value.message);
                              //   }
                              // });
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(AddSize.screenWidth, AddSize.size50),
                              backgroundColor: const Color(0xffFBB742),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Send".toUpperCase(),
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: .5,
                                fontSize: 20,
                              ),
                            ),
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
      ),
    );
  }
}
