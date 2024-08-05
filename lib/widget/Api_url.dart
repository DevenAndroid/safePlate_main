import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class ApiUrl{
  static const baseUrl = "https://safegate.webdemozone.com/api/v1/";
  static const loginApi = "${baseUrl}login";
  static const signApi = "${baseUrl}register";
  static const forgotMailApi = "${baseUrl}forgotPassword";
  static const verifyOtpApi = "${baseUrl}otpverify";
  static const resetOtpApi = "${baseUrl}resetpassword";
  static const resetPasswordApi = "${baseUrl}resetpassword";
  static const signupOTPApi = "${baseUrl}emailotpverify";
  static const profile = "${baseUrl}profile";
  static const updateProfile = "${baseUrl}updateprofile";
  static const addFamilyMember = "${baseUrl}addmember";
  static const likePost = "${baseUrl}likepost/";

  static const getFamilyMember = "${baseUrl}members";



  static const delete = "${baseUrl}removemember?membersemail=";

  static const createCommunity = "${baseUrl}addpost";
  static const getMyPost = "${baseUrl}posts";
  static const getAllPost = "${baseUrl}allposts";


}
Future getAuthHeader() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var gg = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    if (pref.getString("cookie") != null)
      HttpHeaders.authorizationHeader:
      'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
  };
  return gg;
}