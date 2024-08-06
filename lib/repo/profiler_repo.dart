import 'dart:convert';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/profile_model.dart';




Future<ProfileModel> profileRepo() async {
  try {
    http.Response response = await http.get(

      Uri.parse(ApiUrl.profile),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {

      print("data1${jsonDecode(response.body)}");
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {

      print("data2${jsonDecode(response.body)}");
      return ProfileModel(
          message: jsonDecode(response.body)["message"],
          success: false,
          user: null);
    }
  } catch (e) {
    print("errorrrrrrrrrrrrrrrrrrr");
    return ProfileModel(message: e.toString(), success: false, user: null);
  }
}


