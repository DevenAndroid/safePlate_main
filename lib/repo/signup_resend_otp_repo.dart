
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:Safeplate/model/common_model.dart';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<CommonModel> signupresetOtpRepo(
    {required String email,
      required BuildContext context, required String type}) async {
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);
  var map = <String, dynamic>{};
  map['email'] = email;
  map['type'] = type;

  log("Login Data map$map");
  try {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };

    http.Response response = await http.post(Uri.parse(ApiUrl.resetOtpApi),
        body: jsonEncode(map), headers: headers);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      NewHelper.hideLoader(loader);
      log("Login Data map${response.body}");
      return CommonModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      NewHelper.hideLoader(loader);
      return CommonModel.fromJson(json.decode(response.body));
      // throw Exception(response.body);
    } else {
      NewHelper.hideLoader(loader);
      return CommonModel.fromJson(json.decode(response.body));
      // throw Exception(response.body);
    }
  } catch (e) {
    NewHelper.hideLoader(loader);
    throw Exception(e.toString());
  }
}