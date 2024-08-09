import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/add_comment_model.dart';
import '../widget/Api_url.dart';
import '../widget/helper.dart';

Future<AddCommentModel> addComment({required String postId,required String message,required username, required BuildContext context}) async {


  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context).insert(loader);

  var map = <String, dynamic>{};
  map["name"]=username;
  map["message"]=message;

  try {
    var url =ApiUrl.commentPost ;
    http.Response response = await http.post(
      Uri.parse('$url$postId'),
      body: jsonEncode(map),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      NewHelper.hideLoader(loader);
      log('Response Body: ${response.body}');
      return AddCommentModel.fromJson(jsonDecode(response.body));
    } else {
      NewHelper.hideLoader(loader);
      return AddCommentModel.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    NewHelper.hideLoader(loader);
    throw Exception(e.toString());
  }
}
