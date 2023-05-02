import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constant/api_routes.dart';

class AuthServices {
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static Future<dynamic> verifyTokenService(
      {required String accessToken}) async {
    var response = await http.post(
      Uri.parse(ApiRoutes.loginApi),
      headers: {...headers, 'Authorization': 'Bearer $accessToken'},
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.body.toString());
      print('some error');
      // String error = jsonDecode(response.body)['message'];
      // throw (error);
    }
  }
}
