import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/models/user.dart';
import 'package:ruralclap_app/services/job_service.dart';

class JobController extends GetxController {
  final UserController _userController = Get.find<UserController>();
  RxList<Job> categoryJobList = <Job>[].obs;
  RxList<Job> employerJobList = <Job>[].obs;
  RxBool isLoading = false.obs;
  RxList<User> applicantList = <User>[].obs;
  RxList<Job> appliedJobList = <Job>[].obs;
  RxList<Job> jobRequestList = <Job>[].obs;

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
      // _job.value = Job.fromJson(res);
    }
  }

  Future<void> listEmployerJobs({required int employerId}) async {
    try {
      String accessToken = await getAccessToken();
      var res = await JobServices.listEmployerJobsService(
          accessToken: accessToken, employerId: employerId);
      List<Job> resJobList = [];
      res.forEach((jsonJob) {
        // jsonJob['fields']['id'] = jsonJob['pk'];
        resJobList.add(Job.fromJson(jsonJob));
      });
      employerJobList.value = resJobList;
      employerJobList.refresh();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Job>> getJobList({required status}) async {
    try {
      String accessToken = await getAccessToken();
      var res = await JobServices.getJobList(
          accessToken: accessToken,
          category: _userController.user.category ?? '',
          status: status);
      List<Job> resJobList = [];
      res.forEach((jsonJob) {
        resJobList.add(Job.fromJson(jsonJob));
      });
      return resJobList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> getJobRequestList({required status}) async {
    try {
      String accessToken = await getAccessToken();
      var res = await JobServices.getJobList(
          accessToken: accessToken,
          category: _userController.user.category ?? '',
          status: status);
      List<Job> resJobList = [];
      res.forEach((jsonJob) {
        resJobList.add(Job.fromJson(jsonJob));
      });
      jobRequestList.value = resJobList;
      jobRequestList.refresh();
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

  Future<void> getJobApplicantList({required int? jobId}) async {
    try {
      isLoading.value = true;
      String accessToken = await getAccessToken();
      var res = await JobServices.getJobApplicantService(
          jobId: jobId, accessToken: accessToken);
      List<User> resApplicantList = [];
      res.forEach((json) {
        resApplicantList.add(User.fromJson(json['user_id']));
      });
      applicantList.value = resApplicantList;
      applicantList.refresh();
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  Future<List<Job>> getAllUserAppliedJob({required int? userId}) async {
    try {
      isLoading.value = true;
      String accessToken = await getAccessToken();
      var res = await JobServices.getAllUserAppliedJob(
          userId: userId, accessToken: accessToken);
      List<Job> resJobList = [];
      res.forEach((json) {
        resJobList.add(Job.fromJson(json['job_id']));
      });
      isLoading.value = false;
      return resJobList;
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
    return [];
  }

  Future<bool> jobAction(
      {int userId = -1, required String status, required int jobId}) async {
    try {
      String accessToken = await getAccessToken();
      var res = await JobServices.jobActionService(
          jobId: jobId,
          status: status,
          userId: userId,
          accessToken: accessToken);

      jobRequestList.removeWhere((job) {
        if (job.id != jobId) {
          return true;
        } else {
          return false;
        }
      });
      jobRequestList.refresh();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
