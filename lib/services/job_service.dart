import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constant/api_routes.dart';
import '../models/job.dart';

class JobServices {
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static Future<dynamic> createJobService(
      {required String accessToken, required Job jobData}) async {
    var response = await http.post(
      Uri.parse(ApiRoutes.createJobApi),
      headers: {...headers, 'Authorization': 'Bearer $accessToken'},
      body: jsonEncode(jobData),
    );
    if (response.statusCode.toString().contains('2')) {
      return jsonDecode(response.body);
    } else {
      return "Error400";
    }
  }

  static Future<dynamic> listEmployerJobsService(
      {required String accessToken, required int? employerId}) async {
    var response = await http.get(
      Uri.parse(ApiRoutes.listEmployerJobsApi),
      headers: {
        ...headers,
        'Authorization': 'Bearer $accessToken',
        'Employer': '$employerId'
      },
    );
    if (response.statusCode.toString().contains('2')) {
      return jsonDecode(response.body);
    } else {
      return "Error400";
    }
  }
}
