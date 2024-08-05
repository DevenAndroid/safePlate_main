import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:Safeplate/model/common_model.dart';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/family_member_edit_model.dart';

Future<FamilyMemberEditModel> familyMemberEditRepo(
    {required String email,
      required  String name,
      required  String relationship,
      required  String phonenumber,
      required BuildContext context}) async {
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);
  var map = <String, dynamic>{};
  map['email'] = email;
  map['name'] = name;
  map['relationship'] = relationship;
  map['phonenumber'] = phonenumber;

  log("Login Data map$map");
  try {

    http.Response response = await http.post(Uri.parse(ApiUrl.forgotMailApi),
        body: jsonEncode(map),headers: await getAuthHeader());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      NewHelper.hideLoader(loader);
      return FamilyMemberEditModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      NewHelper.hideLoader(loader);
      return FamilyMemberEditModel.fromJson(json.decode(response.body));

      throw Exception(response.body);
    } else {
      NewHelper.hideLoader(loader);
      // throw Exception(response.body);
      return FamilyMemberEditModel.fromJson(json.decode(response.body));
    }
  } catch (e) {
    NewHelper.hideLoader(loader);
    throw Exception(e.toString());
  }
}