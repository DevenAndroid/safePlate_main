import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:Safeplate/model/sign_up_model.dart';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<SignUpModel> signRepo(
    {email,
    password,
    name,
    phonenumber,
    termscondition,
    required BuildContext context}) async {
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);
  SharedPreferences pref = await SharedPreferences.getInstance();
  //print("These are details.....${pref}");
  var map = <String, dynamic>{};
  map['email'] = email;
  map['password'] = password;
  map['name'] = name;
  map['phonenumber'] = phonenumber;
  map['termscondition'] = termscondition;

  log("SignUp Data map$map");
  try {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };

    http.Response response = await http.post(Uri.parse(ApiUrl.signApi),
        body: jsonEncode(map), headers: headers);
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 400) {
      NewHelper.hideLoader(loader);

      return SignUpModel.fromJson(json.decode(response.body));

    } else if (response.statusCode == 422||response.statusCode == 401) {
      NewHelper.hideLoader(loader);
      return SignUpModel.fromJson(json.decode(response.body));
      showToast(SignUpModel.fromJson(json.decode(response.body)).message.toString());
    } else {
      print("abc${SignUpModel.fromJson(json.decode(response.body)).message.toString()}");
      NewHelper.hideLoader(loader);
      return SignUpModel.fromJson(json.decode(response.body));
    }
  } catch (e) {

    throw Exception(e.toString());
  }
}
