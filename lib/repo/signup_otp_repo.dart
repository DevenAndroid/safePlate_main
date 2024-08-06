import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/signup_otp.dart';

Future<SignupOTPModel> signupOTPRepo(
    {required String email,
      required  otp,
      required BuildContext context}) async {
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);
  var map = <String, dynamic>{};
  map['email'] = email;
  map['otp'] = otp;
  map['type'] = 'pswdotp';

  log("Login Data map$map");
  try {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      //'Cookie': 'connect.sid=s%3Ak6nhc_76OKSswNfV8zhdyQ5qjlhRk308.uIkd%2FeX97K2NoPPe%2Bhi1PiM7uKpDLqtljdyIKteCrgY'
    };

    http.Response response = await http.post(Uri.parse(ApiUrl.signupOTPApi),
        body: jsonEncode(map), headers: headers);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      NewHelper.hideLoader(loader);
      return SignupOTPModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      NewHelper.hideLoader(loader);
      return SignupOTPModel.fromJson(json.decode(response.body));
      // throw Exception(response.body);
    } else {
      NewHelper.hideLoader(loader);
      //  throw Exception(response.body);
      return SignupOTPModel.fromJson(json.decode(response.body));
    }
  } catch (e) {
    NewHelper.hideLoader(loader);
    throw Exception(e.toString());
  }
}
