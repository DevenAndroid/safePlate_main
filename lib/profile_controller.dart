// import 'dart:developer';
// import 'package:Safeplate/repo/profile_repo.dart';
// import 'package:Safeplate/widget/helper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'model/profie_model.dart';
//
// // import '../model/my_profile_model.dart';
// // import '../repo/my_profile_repo.dart';
//
// class ProfileController extends GetxController {
//   Rx<RxStatus> statusOfProfile = RxStatus.empty().obs;
//
//   Rx<ProfileData> profile = ProfileData().obs;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//
//   TextEditingController aboutController = TextEditingController();
//   TextEditingController fitController = TextEditingController();
//   TextEditingController inchController = TextEditingController();
//   // TextEditingController unitController = TextEditingController();
//    TextEditingController weightController = TextEditingController();
//    TextEditingController ageController = TextEditingController();
//    // TextEditingController heathController = TextEditingController();
//
//   getProfile() {
//     ProfileRepo().then((value) {
//       log("response.body.....    ${value}");
//       profile.value = value;
//       if (value.success == true) {
//         nameController.text = profile.value.user!.name!.toString();
//         phoneNumberController.text =  profile.value.user!.phonenumber.toString();
//         emailController.text = profile.value.user!.email.toString();
//
//
//         aboutController.text = profile.value.user!.aboutme.toString();
//         fitController.text = profile.value.user!.bMI!.ft.toString();
//         inchController.text = profile.value.user!.bMI!.inch.toString();
//         // unitController.text = profile.value.user!.bMI!.unit.toString();
//         weightController.text = profile.value.user!.bMI!.weight.toString();
//         // ageController.text = profile.value.user!.healthConditions![0];
//
//         statusOfProfile.value = RxStatus.success();
//         showToast(value.message);
//       } else {
//         showToast(value.message);
//         statusOfProfile.value = RxStatus.error();
//       }
//     });
//   }
//
// }
//
//
//
