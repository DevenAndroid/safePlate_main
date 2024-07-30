import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:Safeplate/model/common_model.dart';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:Safeplate/widget/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/update_profile.dart';
import 'login_repo.dart';

Future<UpdateProfile> updateProfileRepo(
    {required String email,
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
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      // 'Cookie': 'connect.sid=s%3Ak6nhc_76OKSswNfV8zhdyQ5qjlhRk308.uIkd%2FeX97K2NoPPe%2Bhi1PiM7uKpDLqtljdyIKteCrgY'
      'Cookie': token
    };

    http.Response response = await http.patch(Uri.parse(ApiUrl.updateProfile),
        body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      NewHelper.hideLoader(loader);
      return UpdateProfile.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      NewHelper.hideLoader(loader);
      return UpdateProfile.fromJson(json.decode(response.body));

      throw Exception(response.body);
    } else {
      NewHelper.hideLoader(loader);
      // throw Exception(response.body);
      return UpdateProfile.fromJson(json.decode(response.body));
    }
  } catch (e) {
    NewHelper.hideLoader(loader);
    throw Exception(e.toString());
  }
}