import 'dart:convert';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:http/http.dart' as http;
import '../model/allfamily_member_model.dart';
import '../model/profile_model.dart';




Future<FamilyMemberModel> allFamilyMemberRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrl.getFamilyMember),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return FamilyMemberModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return FamilyMemberModel(
          message: jsonDecode(response.body)["message"],
          success: false,
          membersdata: null);
    }
  } catch (e) {
    return FamilyMemberModel(message: e.toString(), success: false, membersdata: null);
  }
}


