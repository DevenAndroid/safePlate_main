import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:Safeplate/model/common_model.dart';
import 'package:Safeplate/model/login_model.dart';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../screen/BottomNavBar/bottomnavbar.dart';
String token = "";
Future<LoginModel> loginRepo(
    {required String email,
      required String password,
      required String tokenid,
      required BuildContext context}) async {

  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);
  SharedPreferences pref = await SharedPreferences.getInstance();
  var map = <String, dynamic>{};
  map['email'] = email;
  map['password'] = password;

  log("Login Data map$map");

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
   'deviceToken':tokenid
    // HttpHeaders.authorizationHeader: 'Bearer ${user.accessToken}'
    // 'deviceToken':deviceID,
  };

  http.Response response = await http.post(Uri.parse(ApiUrl.loginApi),
      body: jsonEncode(map), headers: headers);

  log(response.statusCode.toString());
  log(response.body.toString());
  if (response.statusCode == 200 ||
      response.statusCode == 201
  ) {
    // final cookies = response.headers['set-cookie'];
    // if (cookies != null) {
    //   final prefs = await SharedPreferences.getInstance();
    //   await prefs.setString('cookies', cookies);
    //   token=cookies.toString();
    //   print('Cookies stored successfully${cookies.toString().replaceAll('\"', '')}');
    // } else {
    //   print('No cookies received');
    // }

    NewHelper.hideLoader(loader);
    final data = response.body.toString();
    print("dta${data}");
    // Get.toNamed(BottomNavbar.route,);
    return LoginModel.fromJson(json.decode(response.body));
  } else if (response.statusCode == 401) {
    NewHelper.hideLoader(loader);
    final data = response.body.toString();
    print("dta${data}");
    return LoginModel.fromJson(json.decode(response.body));
  } else {
    NewHelper.hideLoader(loader);
    final data = response.body.toString();
    print("dta${data}");
    return LoginModel.fromJson(json.decode(response.body));
  }
}
// catch (e) {
//   NewHelper.hideLoader(loader);
//   print("dtaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//   throw Exception(e.toString());
// }
