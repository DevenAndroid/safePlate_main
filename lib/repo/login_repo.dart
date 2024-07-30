import 'dart:convert';
import 'dart:developer';
import 'dart:io';

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
      required BuildContext context}) async {
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);
  SharedPreferences pref = await SharedPreferences.getInstance();
  //print("These are details.....${pref}");
  var map = <String, dynamic>{};
  map['email'] = email;
  map['password'] = password;

  log("Login Data map$map");
  try {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:''
    };

    http.Response response = await http.post(Uri.parse(ApiUrl.loginApi),
        body: jsonEncode(map), headers: headers);

    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      final cookies = response.headers['set-cookie'];
      if (cookies != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('cookies', cookies);
        token=cookies.toString();
        print('Cookies stored successfully${cookies.toString()}');
      } else {
        print('No cookies received');
      }

      NewHelper.hideLoader(loader);
      Get.toNamed(BottomNavbar.route,
      );
      return LoginModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      NewHelper.hideLoader(loader);
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      NewHelper.hideLoader(loader);
      return LoginModel.fromJson(json.decode(response.body));
    }
  } catch (e) {
    NewHelper.hideLoader(loader);
    throw Exception(e.toString());
  }
}