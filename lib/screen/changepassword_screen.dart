import 'package:Safeplate/repo/reset_password.dart';
import 'package:Safeplate/resources/dimension.dart';
import 'package:Safeplate/screen/login_screen.dart';
import 'package:Safeplate/widget/custom_textfield.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  static var route = "/changePasswordScreen";

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var obscureText1 = true;
  var obscureText2 = true;
  void initState() {
    // TODO: implement initState
    super.initState();
    text = Get.arguments[0];

  }
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              // height: Get.height,
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
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.black, size: 22),
                      SizedBox(
                          width:
                              8), // Add some spacing between the icon and text
                      Text(
                        "Change Password",
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
                // height: AddSize.screenHeight,
                padding: EdgeInsets.symmetric(horizontal: AddSize.padding20),
                margin: EdgeInsets.only(top: AddSize.size30),
                decoration: const BoxDecoration(
                    color: Color(0xff75D051),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Form(
                   key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Change Password",
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: AddSize.size10,
                          ),
                          Text(
                            "Your password must be different from previous used password.",
                            style: GoogleFonts.roboto(
                              height: 1.5,
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          SizedBox(
                            height: AddSize.size20,
                          ),

                          Text(
                            "New Password",
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: const Color(0xffFAFAFA),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.012,
                            // height: AddSize.size8,
                          ),
                          CommonTextFieldWidget(
                            textInputAction: TextInputAction.next,
                            hint: 'Enter New Password',
                            controller: newPassword,
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
                            // controller: emailController,
                            validator:MultiValidator([
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
                            height: AddSize.size20,
                          ),

                          Text(
                            "Confirm New Password",
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: const Color(0xffFAFAFA),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.012,
                            // height: AddSize.size5,
                          ),
                          CommonTextFieldWidget(controller: confirmPassword,
                            textInputAction: TextInputAction.next,
                            hint: 'Enter Confirm New Password',
                            obscureText: obscureText2,
                            suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscureText2 = !obscureText2;
                                  });
                                },
                                child: obscureText2
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Color(0xFF53B176),
                                      )),
                            // controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "confirm the password";
                              } else if (newPassword.text !=
                                  confirmPassword.text) {
                                return "Confirm password should be match";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: AddSize.size25,
                          ),

                          ElevatedButton(
                              onPressed: () async {
                                if(_formKey.currentState!.validate()){
                                  resetPasswordRepo(email: text,password: confirmPassword.text, context: context,).then((value) {
                                    if(value.success == true){
                                      showToast(value.message);
                                      Get.offAllNamed(LoginScreen.route);
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
                              child: Text("save password".toUpperCase(),
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      letterSpacing: .5,
                                      fontSize: 20))),
                          // SizedBox(
                          //   height: AddSize.size30,
                          // ),
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
