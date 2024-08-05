import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/mypostcommunity_model.dart';
import '../widget/Api_url.dart';
Future<MyPostCommunity> myPostRepo() async {
  // try {
  final response = await http.get(
    Uri.parse(ApiUrl.getMyPost),
    headers: await getAuthHeader(),);
  log("response....    ${response.body}");
  if (response.statusCode == 200) {
    log("Help Center Repository...${response.body}");
    return MyPostCommunity.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }

}
