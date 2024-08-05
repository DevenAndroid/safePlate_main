import 'dart:developer';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/profile_model.dart';
import '../repo/profiler_repo.dart';

class ProfileController extends GetxController {
  Rx<RxStatus> statusOfProfile = RxStatus.empty().obs;
  Rx<ProfileModel> profile = ProfileModel().obs;
 // Rx<TextEditingController> nameController = TextEditingController().obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController fitController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heathController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();


  final unitItems = ['1',"2" ,"3","4",'5',"6" ,"8","9","7",'10','11','12','13','14','15'];
  final unitItems1 = ['1',"2" ,"3","4",'5',"6" ,"8","9","7",'10','11','12','13','14','15'];
  dynamic selectUnit1;
  dynamic selectUnit;

  final selectGender = ['male', 'female'];
  dynamic chooseGender;

  getProfile() {
    profileRepo().then((value) {
      log("response.body..... ${value}");
      profile.value = value;
      if (value.success == true) {
        // Log the entire user object for debugging
        log("User data: ${profile.value.user.toString()}");

        // Ensure healthConditions is a string
        // String healt = profile.value.user!.healthConditions?.toString() ?? "";

        // Ensure selectUnit and selectUnit1 are strings
        selectUnit = profile.value.user!.bMI!.unit2?.toString() ?? "1";
        selectUnit1 = profile.value.user!.bMI!.unit?.toString() ?? "1";

        // Ensure chooseGender is a string
        chooseGender = profile.value.user!.gender?.toString() ?? 'male';

        // Populate the controllers
        nameController.text = profile.value.user!.name.toString() ?? "";
        phoneNumberController.text = profile.value.user!.phonenumber.toString() ?? "";
        postcodeController.text = profile.value.user!.postcode.toString() ?? "";
        emailController.text = profile.value.user!.email.toString() ?? "";
        aboutController.text = profile.value.user!.aboutme.toString() ?? "";
        fitController.text = profile.value.user!.bMI!.ft.toString() ?? "";
        inchController.text = profile.value.user!.bMI!.inch.toString() ?? "";
        weightController.text = profile.value.user!.bMI!.weight.toString() ?? "";
        ageController.text = profile.value.user!.age.toString() ?? "";

        // Replace commas in healthConditions string
        heathController.text = profile.value.user!.healthConditions?.toString() ?? "";

        statusOfProfile.value = RxStatus.success();
        showToast(value.message);
        print('Data success: ${value.message.toString()}');
      } else {
        showToast(value.message);
        print('Data error: ${value.message.toString()}');
        statusOfProfile.value = RxStatus.error();
      }
    }).catchError((error) {
      log("Error: $error");
      showToast("An error occurred");
      statusOfProfile.value = RxStatus.error();
    });
  }


}



