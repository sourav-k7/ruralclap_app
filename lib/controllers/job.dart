import 'dart:convert';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/api_routes.dart';
import 'package:ruralclap_app/models/job.dart';
import '../widgets/errorSnackBar.dart';
import 'package:http/http.dart' as http;

class JobController extends GetxController {
  final Rx<Job> _job = Job().obs;
  Job get job => _job.value;

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<void> submitJob({required Job jobData}) async {
    print("Submitting Form");
    var response = await http.post(
      Uri.parse(ApiRoutes.createJobApi),
      headers: {...headers},
      body: jsonEncode(jobData),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.body.toString());
    }
  }
}
