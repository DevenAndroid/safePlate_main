// import 'dart:developer';
// import 'package:Safeplate/repo/profile_repo.dart';
// import 'package:Safeplate/widget/helper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'model/addnew_family_model.dart';
// import 'model/profie_model.dart';
//
//
// class AddFamilyController extends GetxController {
//   Rx<RxStatus> statusOfProfile = RxStatus.empty().obs;
//
//   Rx<AddNewFamilyMemberModel> addFamily = AddNewFamilyMemberModel().obs;
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController relationsController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//
//   getFamily() {
//     AddNewFamilyMemberRepo().then((value) {
//       log("response.body.....    ${value}");
//       addFamily.value = value;
//       if (value.success == true) {
//         nameController.text = addFamily.value.
//         relationsController.text =  addFamily.value.user!.phonenumber.toString();
//         emailController.text = profile.value.user!.email.toString();
//         phoneNumberController.text = profile.value.user!.aboutme.toString();
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
