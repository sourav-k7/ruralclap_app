import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/services/job_service.dart';

class JobController extends GetxController {
  final Rx<Job> _job = Job().obs;
  Job get job => _job.value;
  final UserController _userController = Get.find<UserController>();
  RxList<Job> categoryJobList = <Job>[].obs;

  Future<String> getAccessToken() async {
    const storage = FlutterSecureStorage();
    var accessToken = await storage.read(key: 'accessToken');
    return accessToken ?? '';
  }

  Future<void> createJob({required Job jobData}) async {
    String accessToken = await getAccessToken();
    var res = await JobServices.createJobService(
        accessToken: accessToken, jobData: jobData);
    if (res != 'Error400') {
      _job.value = Job.fromJson(res);
    }
  }

  Future<void> listEmployerJobs({required int? employerId}) async {
    String accessToken = await getAccessToken();
    var res = await JobServices.listEmployerJobsService(
        accessToken: accessToken, employerId: employerId);
    if (res != 'Error400') {
      if (_userController.user.isEmployer!) {
      } else {
        print(res['userData']);
      }
    }
  }

  Future<void> getJobList() async {
    try {
      String accessToken = await getAccessToken();
      var res = await JobServices.getJobList(
          accessToken: accessToken,
          category: _userController.user.category ?? '');
      List<Job> resJobList = [];
      res.forEach((jsonJob) {
        resJobList.add(Job.fromJson(jsonJob));
      });
      categoryJobList.value = resJobList;
      categoryJobList.refresh();
    } catch (e) {
      print(e);
    }
  }
}
