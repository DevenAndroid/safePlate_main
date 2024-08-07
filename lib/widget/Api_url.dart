import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class ApiUrl{
  static const baseUrl = "https://safegate.webdemozone.com/api/v1/";
  static const onBoarding = "${baseUrl}onboarding";
  static const loginApi = "${baseUrl}login";
  static const signApi = "${baseUrl}register";
  static const forgotMailApi = "${baseUrl}forgotPassword";
  static const verifyOtpApi = "${baseUrl}otpverify";
  static const resetOtpApi = "${baseUrl}resendotp";
  static const resetPasswordApi = "${baseUrl}resetpassword";
  static const signupOTPApi = "${baseUrl}emailotpverify";
  static const profile = "${baseUrl}profile";
  static const updateProfile = "${baseUrl}updateprofile";
  static const addFamilyMember = "${baseUrl}addmember";
  static const likePost = "${baseUrl}likepost/";
  static const getFamilyMember = "${baseUrl}members";
  static const delete = "${baseUrl}removemember?membersemail=";
  static const editFamilyMember = "${baseUrl}updatemember";
  static const createCommunity = "${baseUrl}addpost";
  static const getMyPost = "${baseUrl}posts";
  static const getAllPost = "${baseUrl}allposts";
  static const commentPost = "${baseUrl}addcomment/";
  static const singlePost = "${baseUrl}posts/";


}
Future getAuthHeader() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var gg = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    'Content-Type': 'application/json; charset=UTF-8',
    if (pref.getString("cookie") != null)
      HttpHeaders.authorizationHeader:
      'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
  };
  return gg;
}


Future getRefresh() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var hh = {
    if (pref.getString("refreshToken") != null){
      'refreshtoken': pref.getString("refreshToken")!.toString(),
    }
     // HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("refreshToken")!.toString().replaceAll('\"', '')}',
  };
  return hh;
}