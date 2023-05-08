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
  RxList<Job> employerJobList = <Job>[].obs;

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
    try {
      String accessToken = await getAccessToken();
      var res = await JobServices.listEmployerJobsService(
          accessToken: accessToken, employerId: employerId);
      List<Job> resJobList = [];
      print(res);
      res.forEach((jsonJob) {
        resJobList.add(Job.fromJson(jsonJob['fields']));
      });
      employerJobList.value = resJobList;
      employerJobList.refresh();
    } catch (e) {
      print(e);
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

  Future<bool> applyForJob({required int userId, required int jobId}) async {
    try {
      String accessToken = await getAccessToken();
      var res = await JobServices.applyJob(
          accessToken: accessToken, userId: userId, jobId: jobId);
      if (res == true) {
        categoryJobList.value =
            categoryJobList.where((job) => job.id != jobId).toList();
        categoryJobList.refresh();
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
