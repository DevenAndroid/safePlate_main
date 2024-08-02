import 'dart:convert';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/common_model.dart';
import '../model/profile_model.dart';

Future<CommonModel> deleteRepo(
    {required String email, required BuildContext context}) async {
  try {
    String url = ApiUrl.delete;
    http.Response response = await http.delete(
      Uri.parse('$url${email}'),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return CommonModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return CommonModel(
          message: jsonDecode(response.body)["message"], success: false);
    }
  } catch (e) {
    return CommonModel(message: e.toString(), success: false);
  }
}
