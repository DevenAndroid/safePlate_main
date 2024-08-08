import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/all_post_community_model.dart';
import '../model/single_post_model.dart';
import '../widget/Api_url.dart';

import '../widget/helper.dart';

Future<SinglePostModel> singlePostRepo(
    {required BuildContext context, required String id}) async {
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);
  try {
   String urls=ApiUrl.singlePost;
    final response = await http.get(
      Uri.parse("$urls$id" ),
      headers: await getAuthHeader(),
    );
    log("response....    ${response.body}");
    if (response.statusCode == 200) {
      log("Help Center Repository...${response.body}");
      NewHelper.hideLoader(loader);
      return SinglePostModel.fromJson(jsonDecode(response.body));
    } else {
      log("Help Center Repository...${response.body}");
      NewHelper.hideLoader(loader);

      throw Exception(response.body);
    }
  } catch (e) {
    NewHelper.hideLoader(loader);
    throw Exception(e.toString());
  }
}
