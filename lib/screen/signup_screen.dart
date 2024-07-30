import 'dart:developer';
import 'dart:io';

import 'package:Safeplate/repo/sign_up_repo.dart';
import 'package:Safeplate/resources/dimension.dart';
import 'package:Safeplate/screen/login_screen.dart';
import 'package:Safeplate/screen/signup_otp.dart';
import 'package:Safeplate/widget/custom_textfield.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static var route = "/signUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  bool showValidation = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  var obscureText1 = true;
  bool? _isValue = false;
  final RxStatus status = RxStatus.loading();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              // height: 500.0, // Specify the height here
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Login.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AddSize.padding16,vertical: Get.height*0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up",
                        style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff283841)),
                      ),
                      SizedBox(
                        height: AddSize.size16,
                      ),
                      Text(
                        "Only features this provides is syncing across devices + community updates",
                        style: GoogleFonts.roboto(
                            height:1.5,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff466148)),
                      )
                    ],
                                    ),
                  ),),




                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                     height: 590,
                   // width: G,
                   //  jnecdkjewfcnewk
                   // height:Get.height*0.78,
                    // height: 640,
                    //   height: Get.height*0.7,
                     padding: EdgeInsets.symmetric(horizontal: AddSize.padding18,vertical:AddSize.size30 ),
                     margin: EdgeInsets.only(top: AddSize.size30),
                    decoration: const BoxDecoration(
                        color: Color(0xff75D051),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffFAFAFA),
                              ),
                            ),

                            SizedBox(
                              height: AddSize.size12,
                            ),
                            CommonTextFieldWidget(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              hint: 'Enter Your Name',
                              controller: nameController,
                              
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Please Enter Name'.tr;
                                } else if (value.length >= 30) {
                                  return 'Name cannot exceed 30 characters'.tr;
                                }
                                else if (RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])').hasMatch(value)) {
                                  return 'Name is not accept in emoji'.tr;
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: AddSize.size20,
                            ),
                            Text(
                              "Email",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color:const Color(0xffFAFAFA),
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email is required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: AddSize.size20,
                            ),
                            Text(
                              "Phone Number",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color:const Color(0xffFAFAFA),
                              ),
                            ),

                            SizedBox(
                              height: AddSize.size12,
                            ),

                            CommonTextFieldWidget(
                              textInputAction: TextInputAction.next,
                              hint: 'Enter Your Phone Number',
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                              validator: (value) {
                            if (value!.isEmpty
                               // || RegExp(r'^(?:\+?88|0088)?01[13-9]\d{8}$').hasMatch(value)
                            ) {
                              return "Phone number is required";
                            } else if  (value.length > 10) {
                              return 'number cannot exceed 10 characters'.tr;
                            }
                            return null;
                          },
                            ),
                            SizedBox(
                              height: AddSize.size20,
                            ),
                            Text(
                              "Password",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color:const Color(0xffFAFAFA),
                              ),
                            ),

                            SizedBox(
                              height: AddSize.size12,
                            ),
                            CommonTextFieldWidget(
                              textInputAction: TextInputAction.next,

                              hint: 'Enter Your Password',
                              obscureText: obscureText1,
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
                              controller: passwordController,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Password must be minimum 8 characters, with \n1 Capital letter & 1 numerical.'),
                                MinLengthValidator(8,
                                    errorText:
                                    'Password must be minimum 8 characters, with \n1 Capital letter & 1 numerical.'),
                                PatternValidator(
                                    r'^(?=.*[A-Z])(?=.*\d).{8,}$',
                                    // r"^[a-zA-Z]{8,10}$",
                                    errorText:
                                    'Password must be minimum 8 characters, with \n1 Capital letter & 1 numerical.')
                              ]),
                            ),
                            SizedBox(
                              height: AddSize.size10,
                            ),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1,
                                  child: Checkbox(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                     visualDensity: VisualDensity.compact,
                                      autofocus: true,
                                      side: BorderSide(
                                          color: showValidation == false
                                              ? const Color(0xffFBB742)
                                              : Colors.red,
                                          width: 2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      activeColor: const Color(0xffFBB742),
                                      value: _isValue,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isValue = value;
                                        });
                                      }),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Get.toNamed(TermsOfUseScreen.route);
                                  },
                                  child: Text(
                                    "Terms And Conditions",
                                    style:
                                      GoogleFonts.roboto(
                                        color:Colors.white,
                                        fontSize:14,
                                        fontWeight:FontWeight.w400
                                      )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: AddSize.size25,
                            ),
                            ElevatedButton(
                                onPressed: () async {

                                  if (_formKey.currentState!.validate()) {
                                    signRepo(
                                        name: nameController.text,
                                        password: passwordController.text,
                                        email: emailController.text,
                                        phonenumber: phoneController.text,
                                        termscondition: true,
                                        context: context



                                    ).then((value) {
                                      if (value.success == true) {

                                        print("data");
                                        showToast(value.message);
                                        Get.toNamed(SignupOtp.route,arguments: emailController.text);

                                      //  Get.toNamed(LoginScreen.route);
                                      } else {
                                        print("data>>>>>>>");
                                        showToast(value.message);
                                      }
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      Size(AddSize.screenWidth, AddSize.size50),
                                  backgroundColor: const Color(0xffFBB742),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                child: Text("Sign Up".toUpperCase(),
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
                                      borderRadius: BorderRadius.circular(12),
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
                              height: AddSize.size50,
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
                                    text: 'Already have an account? ',
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400, fontSize: 18),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Login',
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFBB742),
                                              fontSize: 18


                                          ),
                                      recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle the navigation
                                      Get.toNamed(LoginScreen.route);
                                    },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: AddSize.size30,
                            // ),

                          ],
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
