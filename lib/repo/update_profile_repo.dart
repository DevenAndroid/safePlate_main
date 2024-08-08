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
      name,email,phoneNumber,
      //Dob,
     postcode,
      aboutme,weight,
      unit,
      ft,
      ini,
      unit2,
      age,
      //allergies,
      gender,health,

      required BuildContext context}) async {
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);
  dynamic ages;
  ages = int.parse(age).toInt();

  var map = <String, dynamic>{};
  // var bmi = <String, dynamic>{};
  map["name"]=name.toString();
  map["email"]=email.toString();
  map["phonenumber"]=phoneNumber.toString();
  map["postcode"]=postcode.toString();
  map["aboutme"]=aboutme.toString();
  map["Age"]=ages;
  map["gender"]=gender.toString();
  map["health_conditions"]=health.toString();
  map["weight"]=weight.toString();
  map["Unit"]=unit.toString();
  map["ft"]=ft.toString();
  map["In"]=ini.toString();
  map["Unit2"]=unit2.toString();
  // map["BMI"]=bmi;
  // bmi["weight"]=weight;
  // bmi["Unit"]=unit;
  // bmi["ft"]=ft;
  // bmi["In."]=ini;
  // bmi["Unit_2"]=unit2;

  // final body = jsonEncode({
  //   'name': name,//'ankur',
  //   'email': email,//'Ankur07@yopmail.com',
  //   'phonenumber': phoneNumber,//'5978965898',
  //  // 'dob': '1999-07-07',
  //   'postcode':postcode,// '12345',
  //   'aboutme': aboutme,//'I love coding and hiking.',
  //   'BMI': {
  //     'weight': weight,//'20kg',
  //     'Unit': unit,//'3',
  //     'ft': ft,//'8.9',
  //     'In.': ini,//'12',
  //     'Unit_2':unit2// '7'
  //   },
  //   'Age':ages,// 25,
  //   //'allergies': ['peanuts', 'shellfish'],
  //   'gender': gender,//'male',
  //   'health_conditions': health,//['asthma', 'hypertension']
  // });

  log("Login Data map$map");
 try {

    http.Response response = await http.patch(Uri.parse(ApiUrl.updateProfile),
        body: jsonEncode(map), headers: await getAuthHeader());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      NewHelper.hideLoader(loader);
      print('data${response.body.toString()}');
      return UpdateProfileModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      NewHelper.hideLoader(loader);
      print('data2${response.body.toString()}');
      return UpdateProfileModel.fromJson(json.decode(response.body));

    } else {
      NewHelper.hideLoader(loader);
      print('data3${response.body.toString()}');
      return UpdateProfileModel.fromJson(json.decode(response.body));
    }
 }
  catch (e) {
    NewHelper.hideLoader(loader);
    print('eorror');
    throw Exception(e.toString());
  }
}

