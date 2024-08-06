import 'package:Safeplate/resources/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Safeplate/widget/custom_textfield.dart';
import '../../controller/profile_controller.dart';
import '../../repo/update_profile_repo.dart';
import '../../widget/helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static var route = "/profileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());
  @override
  void initState() {
    profileController.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: const Color(0xff75D051),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "My Profile",
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Obx(() {
        return
          profileController.statusOfProfile.value.isSuccess
            ?
          Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: AddSize.size30 * 3,
                                width: AddSize.size30 * 3,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70),
                                ),
                                child: SvgPicture.asset(
                                  "assets/images/Ellipse 1.svg",
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  top: 5,
                                  child: Container(
                                    height: 30,
                                    width: AddSize.size30,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            profileController.nameController.text.toString(),
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Name",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      EditProfileTextFieldWidget(
                        hint: "Enter Your Name",
                        controller: profileController.nameController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      EditProfileTextFieldWidget(
                        hint: "Enter Your Email",
                        controller: profileController.emailController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Phone Number",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      EditProfileTextFieldWidget(
                        hint: "enter phone number",
                        controller: profileController.phoneNumberController,
                      ),

                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Post Code",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      EditProfileTextFieldWidget(
                        hint: "enter post code",
                        controller: profileController.postcodeController,
                      ),

                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "About Me",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      EditProfileTextFieldWidget(
                        maxLines: 5,
                        hint: "Enter the about",
                        controller: profileController.aboutController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Weight",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                TextFormField(
                                  controller:
                                      profileController.weightController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'enter the Ft',
                                  ),
                                  keyboardType: TextInputType.number,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Unit",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                DropdownButtonFormField<String>(
                                  value: profileController.selectUnit1,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  items: profileController.unitItems
                                      .map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      profileController.selectUnit1 = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ft",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                TextFormField(
                                  controller: profileController.fitController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'enter the Ft',
                                  ),
                                  keyboardType: TextInputType.number,
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "In",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                TextFormField(
                                  controller: profileController.inchController,
                                  decoration: InputDecoration(
                                    hintText: '10 In',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffAFAFAF)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  keyboardType: TextInputType.number,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Unit",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  height: 58,
                                  child: DropdownButtonFormField<String>(
                                    value: profileController.selectUnit,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffAFAFAF)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffAFAFAF)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffAFAFAF)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // border: OutlineInputBorder(
                                      //   ),
                                    ),
                                    items: profileController.unitItems1
                                        .map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        profileController.selectUnit =
                                            newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Age",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                       EditProfileTextFieldWidget(
                         hint: "enter your age",
                         controller:profileController.ageController,
                       ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Gender",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DropdownButtonFormField<String>(
                        value: profileController.chooseGender,
                        icon: Icon(Icons.keyboard_arrow_down),
                        decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffAFAFAF)),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffAFAFAF)),
                              borderRadius: BorderRadius.circular(10)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffAFAFAF)),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        items:
                            profileController.selectGender.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            profileController.chooseGender = newValue!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Health Conditions",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      EditProfileTextFieldWidget(
                        hint: "Health Conditions",
                        controller: profileController.heathController,
                      ),

                      const SizedBox(
                        height: 35,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            print("SDWASFFEWSDFSFWRFW =>${profileController.selectUnit}");
                            print("SDWASFFEWSDFSFWRFW =>${profileController.inchController.text}");
                            updateProfileRepo(
                                    name: profileController.nameController.text,
                                    email: profileController.emailController.text,
                                      age: profileController.ageController.text,
                                    phoneNumber: profileController.phoneNumberController.text,
                                    aboutme:profileController.aboutController.text ,
                                    health: profileController.heathController.text,
                                    weight: profileController.weightController.text,
                                    ft: profileController.fitController.text,
                                    ini: profileController.inchController.text,
                                    postcode: profileController.postcodeController.text,
                                    unit: profileController.selectUnit,
                                    unit2: profileController.selectUnit1,
                                    gender: profileController.chooseGender,
                                    context: context)
                                .then((value) async {
                              if (value.success == true) {
                                print("data1${value.message}");
                                showToast(value.message);
                                profileController.getProfile();
                              } else {
                                print("data2${value.message}");
                                showToast(value.message);
                              }
                            });
                            // Get.toNamed(HomeScreen.route);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(AddSize.screenWidth, AddSize.size50),
                            backgroundColor: Color(0xffFBB742),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text("Update".toUpperCase(),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 20))),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              )
             : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
