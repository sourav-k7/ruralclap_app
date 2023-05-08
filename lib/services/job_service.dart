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
      return jsonDecode(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Some error occurred while fetching create job data');
    }
  }

  static Future<dynamic> getJobList(
      {required String accessToken, required String category}) async {
    var response = await http.get(
      Uri.parse('${ApiRoutes.getJob}?category=$category'),
      headers: {
        ...headers,
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode.toString().contains('2')) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Some error occurred while fetching jobs');
    }
  }

  static Future<dynamic> applyJob({
    required String accessToken,
    required int userId,
    required int jobId,
  }) async {
    var response = await http.post(
      Uri.parse(ApiRoutes.applyJob),
      headers: {...headers, 'Authorization': 'Bearer $accessToken'},
      body: jsonEncode({'user_id': userId, 'job_id': jobId}),
    );
    if (response.statusCode.toString().contains('2')) {
      return true;
    } else {
      if (jsonDecode(response.body)[0] ==
          'This job application already exists') {
        //todo: bottom snackbar if already applied
        return true;
      }
      throw Exception('Error while applying for job');
    }
  }
}
