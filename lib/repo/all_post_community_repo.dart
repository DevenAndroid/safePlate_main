import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/all_post_community_model.dart';
import '../widget/Api_url.dart';
Future<ModelAllCommunity> allPostRepo() async {
  // try {
  final response = await http.get(
    Uri.parse(ApiUrl.getAllPost),
    headers: await getAuthHeader(),);
  log("response....    ${response.body}");
  if (response.statusCode == 200) {
    log("Help Center Repository...${response.body}");
    return ModelAllCommunity.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }

}
