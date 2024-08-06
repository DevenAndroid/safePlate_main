import 'dart:convert';
import 'package:Safeplate/widget/Api_url.dart';
import 'package:http/http.dart' as http;
import '../model/onbording_model.dart';


Future<BoardingModel> onBoardingRepo() async {
  try {
    http.Response response = await http.get(

      Uri.parse(ApiUrl.onBoarding),
     // headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return BoardingModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return BoardingModel(
          message: jsonDecode(response.body)["message"],
          success: false,
          data: null);
    }
  } catch (e) {
    return BoardingModel(message: e.toString(), success: false, data: null);
  }
}



