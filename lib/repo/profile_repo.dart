import 'dart:convert';
import 'dart:io';
import 'package:Safeplate/model/login_model.dart';
import 'package:Safeplate/model/profie_model.dart';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<ProfileData> ProfileRepo() async {
  // OverlayEntry loader = NewHelper.overlayLoader(context);
  // Overlay.of(context).insert(loader);

  // final prefs = await SharedPreferences.getInstance();
  // print("object${prefs.getString("cookies").toString()}");



  try {

    SharedPreferences pref = await SharedPreferences.getInstance();
    LoginModel user = LoginModel.fromJson(jsonDecode(pref.getString('token')!));
    print("object${user.accessToken}");
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer${user.accessToken}'
      // 'Cookie': prefs.getString("cookies").toString().replaceAll('Path=/; Expires=Thu, 15 Aug 2024 09:21:45 GMT; SameSite=None', '')

      // 'Cookie': 'connect.sid=s%3Ak6nhc_76OKSswNfV8zhdyQ5qjlhRk308.uIkd%2FeX97K2NoPPe%2Bhi1PiM7uKpDLqtljdyIKteCrgY',

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