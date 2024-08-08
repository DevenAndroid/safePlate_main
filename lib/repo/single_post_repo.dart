import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/single_post_model.dart';
import '../widget/Api_url.dart';


// Future<SinglePostModel> singlePostRepo(
//     {required BuildContext context, required String id}) async {
//    OverlayEntry loader = NewHelper.overlayLoader(context);Overlay.of(context).insert(loader);
//   try {
//    String urls = ApiUrl.singlePost;
//     final response = await http.get(
//       Uri.parse("$urls$id" ),
//       headers: await getAuthHeader(),
//     );
//     log("response....    ${response.body}");
//     if (response.statusCode == 200) {
//       log("Help Center Repository...${response.body}");
//        NewHelper.hideLoader(loader);
//       return SinglePostModel.fromJson(jsonDecode(response.body));
//     } else {
//       log("Help Center Repository...${response.body}");
//       NewHelper.hideLoader(loader);
//
//       throw Exception(response.body);
//     }
//   } catch (e) {
//     NewHelper.hideLoader(loader);
//     throw Exception(e.toString());
//   }
// }


Future<SinglePostModel> singlePostRepo({required String id, required BuildContext context}) async {
  String urls = ApiUrl.singlePost;
  try {
    http.Response response = await http.get(
      Uri.parse("$urls$id"),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return SinglePostModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return SinglePostModel(
          message: jsonDecode(response.body)["message"],
          success: false,
          post: null);
    }
  } catch (e) {
    return SinglePostModel(message: e.toString(), success: false, post: null);
  }
}