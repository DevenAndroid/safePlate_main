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

import '../model/addnew_family_model.dart';

Future<AddNewFamilyMemberModel> addFamilyMemberRepo(
    {name, email, phonenumber, images, required BuildContext context}) async {
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);

  var map = <String, dynamic>{};
  map['name'] = name;
  map['email'] = email;
  map['phonenumber'] = phonenumber;
 // http.MultipartFile.fromPath('file', images!.path ?? "");
  // map['file'] = http.MultipartFile.fromPath(images);
  // request.files.add(await http.MultipartFile.fromPath('file', _image!.path));


  log("ADD Family Data map$map");
  try {


    http.Response response = await http.post(Uri.parse(ApiUrl.addFamilyMember),
        body: jsonEncode(map),  headers: await getAuthHeader());
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 400) {
      NewHelper.hideLoader(loader);

      return AddNewFamilyMemberModel.fromJson(json.decode(response.body));

    } else if (response.statusCode == 422||response.statusCode == 401 || response.statusCode == 409) {
      NewHelper.hideLoader(loader);
      showToast(AddNewFamilyMemberModel.fromJson(json.decode(response.body)).message.toString());

      throw Exception(response.body);
    } else {
      print("abc${AddNewFamilyMemberModel.fromJson(json.decode(response.body)).message.toString()}");
      NewHelper.hideLoader(loader);
      throw Exception(response.body);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
