import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/services/job_service.dart';

class JobController extends GetxController {
  final Rx<Job> _job = Job().obs;
  Job get job => _job.value;

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<void> submitJob({required Job jobData}) async {
    const storage = FlutterSecureStorage();
    var accessToken = await storage.read(key: 'accessToken');
    if (accessToken != null) {
      var res = await JobServices.createJobService(
          accessToken: accessToken, jobData: jobData);
      if (res != 'Error400') {
        _job.value = Job.fromJson(res);
      }
    }
  }

  Future<void> listEmployerJobs({required int? employerId}) async {
    const storage = FlutterSecureStorage();
    var accessToken = await storage.read(key: 'accessToken');
    if (accessToken != null) {
      var res = await JobServices.listEmployerJobsService(
          accessToken: accessToken, employerId: employerId);
      if (res != 'Error400') {
        print("From List Employer Jobs controller");
        print(res['jobData']);
      }
    }
  }
}
