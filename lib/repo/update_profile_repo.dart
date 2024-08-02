import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/update_profile_model.dart';

Future<UpdateProfileModel> updateProfileRepo(
    {

      required BuildContext context}) async {
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);

  final body = jsonEncode({
    'name': 'ankur',
    'email': 'Ankur07@yopmail.com',
    'phonenumber': '5978965898',
    'dob': '1999-07-07',
    'postcode': '12345',
    'aboutme': 'I love coding and hiking.',
    'BMI': {
      'weight': '20kg',
      'Unit': '3',
      'ft': '8.9',
      'In.': '12',
      'Unit_2': '7'
    },
    'age': 25,
    'allergies': ['peanuts', 'shellfish'],
    'gender': 'male',
    'health_conditions': ['asthma', 'hypertension']
  });

  log("Login Data map$body");
  try {

    http.Response response = await http.patch(Uri.parse(ApiUrl.updateProfile),
        body: jsonEncode(body), headers: await getAuthHeader());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      NewHelper.hideLoader(loader);
      print('data${response.body.toString()}');
      return UpdateProfileModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      NewHelper.hideLoader(loader);
      return UpdateProfileModel.fromJson(json.decode(response.body));

      throw Exception(response.body);
    } else {
      NewHelper.hideLoader(loader);
      // throw Exception(response.body);
      return UpdateProfileModel.fromJson(json.decode(response.body));
    }
  } catch (e) {
    NewHelper.hideLoader(loader);
    throw Exception(e.toString());
  }
}


/*

Future<UpdateProfileModel> updateProfileRepo() async {
  try {
    http.Response response = await http.post(

      Uri.parse(ApiUrl.profile),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return UpdateProfileModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return UpdateProfileModel(
          message: jsonDecode(response.body)["message"],
          success: false,
          user: null);
    }
  } catch (e) {
    return UpdateProfileModel(message: e.toString(), success: false, user: null);
  }
}
 */