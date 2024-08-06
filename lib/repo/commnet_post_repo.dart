import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/comment_post_model.dart';
import '../model/like_post_model.dart';
import '../widget/Api_url.dart';
import '../widget/helper.dart';

Future<CommnetOnPostModel> commentPOst({required String name, required String message,required String productId,required BuildContext context}) async {


  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);

  var map = <String, dynamic>{};
  map["name"]=name;
  map["message"]=message;
  try {
    var url =ApiUrl.commentPost ;
    http.Response response = await http.post(
      Uri.parse('$url$productId'),
      body: jsonEncode(map),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      NewHelper.hideLoader(loader);
      log('Response Body: ${response.body}');
      return CommnetOnPostModel.fromJson(jsonDecode(response.body));
    } else {
      NewHelper.hideLoader(loader);
      throw Exception(response.body);
    }
  } catch (e) {
    NewHelper.hideLoader(loader);
    throw Exception(e.toString());
  }
}
