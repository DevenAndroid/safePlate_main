import 'dart:developer';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/profile_model.dart';
import '../repo/profiler_repo.dart';

class ProfileController extends GetxController {

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
  dynamic selectUnit1="1";
  dynamic selectUnit="1";

  final selectGender = ['male', 'female'];
  dynamic chooseGender;
  Rx<RxStatus> statusOfProfile = RxStatus.empty().obs;
  Rx<ProfileModel> profile = ProfileModel().obs;
  getProfile() {
    profileRepo().then((value) {
      log("response.body..... ${value}");
      profile.value = value;
      if (value.success == true) {
        log("User data: ${profile.value.user.toString()}");
        //log("User data: ${profile.value.user!.bMI!.inch.toString()}");
        //  if(profile.value.user!.bMI != null) {
        //    selectUnit = profile.value.user!.bMI!.unit2 ?? "1";
        //    selectUnit1 = profile.value.user!.bMI!.unit ?? "1";
        //    fitController.text = profile.value.user!.bMI!.ft != null ? double.parse(profile.value.user!.bMI!.ft.toString()).toString():"";
        //    inchController.text = profile.value.user!.bMI!.inch != null ? int.parse(profile.value.user!.bMI!.inch.toString()).toString():"";
        //    weightController.text = profile.value.user!.bMI!.weight ??"";
        //  }

        chooseGender = profile.value.user!.gender ?? 'male';

        // Populate the controllers
        nameController.text = profile.value.user!.name ?? "";
        emailController.text = profile.value.user!.email ?? "";
        phoneNumberController.text = profile.value.user!.phonenumber ?? "";
        postcodeController.text = profile.value.user!.postcode != null?int.parse(profile.value.user!.postcode.toString()).toString():"" ;
        aboutController.text = profile.value.user!.aboutme ?? "";
        ageController.text = profile.value.user!.age != null? int.parse(profile.value.user!.age.toString()).toString():"";


        heathController.text = profile.value.user!.healthConditions ?? "";



        ///BMI//
        weightController.text = profile.value.user!.weight ??"";
        selectUnit1 = profile.value.user!.unit ?? "1";
        fitController.text = profile.value.user!.ft != null ? double.parse(profile.value.user!.ft.toString()).toString():"";
        inchController.text = profile.value.user!.inch != null ? int.parse(profile.value.user!.inch.toString()).toString():"";
        selectUnit = profile.value.user!.unit2 ?? "1";









        statusOfProfile.value = RxStatus.success();
       // showToast(value.message);
        print('Data success: ${value.message.toString()}');
      } else {
        showToast(value.message);
        print('Data error: ${value.message.toString()}');
        statusOfProfile.value = RxStatus.error();
      }
    });
  }


}



