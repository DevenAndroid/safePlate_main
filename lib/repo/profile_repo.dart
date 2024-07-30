import 'dart:convert';
import 'dart:io';
import 'package:Safeplate/model/profie_model.dart';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:http/http.dart' as http;

Future<ProfileData> ProfileRepo() async {
  // OverlayEntry loader = NewHelper.overlayLoader(context);
  // Overlay.of(context).insert(loader);




  try {
    final headers = {
      'Cookie': 'connect.sid=s%3Ak6nhc_76OKSswNfV8zhdyQ5qjlhRk308.uIkd%2FeX97K2NoPPe%2Bhi1PiM7uKpDLqtljdyIKteCrgY',

    };


    http.Response response = await http.get(Uri.parse(ApiUrl.profile), headers: headers);
    print("headers${headers.toString()}");
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      // NewHelper.hideLoader(loader);
      return ProfileData.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      // NewHelper.hideLoader(loader);
      return ProfileData.fromJson(json.decode(response.body));

      throw Exception(response.body);
    } else {
      // NewHelper.hideLoader(loader);
      // throw Exception(response.body);
      return ProfileData.fromJson(json.decode(response.body));
    }
  } catch (e) {
    // NewHelper.hideLoader(loader);
    throw Exception(e.toString());
  }
}