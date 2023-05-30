import 'package:flutter/material.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/job.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/widgets/Applied_Job_Card.dart';

class AppliedJobs extends StatelessWidget {
  const AppliedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Jobs',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConstant.textPrimaryWhite,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          centerTitle: false,
          backgroundColor: ColorConstant.primaryColor,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: ColorConstant.primaryColor,
            tabs: [
              Tab(
                child: Text(
                  'Applied',
                  style: TextStyle(color: ColorConstant.textPrimaryWhite),
                ),
              ),
              Tab(
                child: Text(
                  'Requested',
                  style: TextStyle(
                    color: ColorConstant.textPrimaryWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            JobList(),
            RequestedJobList(),
          ],
        ),
      ),
    );
  }
}

class JobList extends StatefulWidget {
  const JobList({super.key});

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  final UserController _userController = Get.find<UserController>();
  final JobController _jobController = JobController();
  List<Job> appliedJobs = [];
  List<Job> requestedJobs = [];

  @override
  void initState() {
    handleGetAppliedJobs();
    super.initState();
  }

  Future<void> handleGetAppliedJobs() async {
    appliedJobs = await _jobController.getAllUserAppliedJob(
        userId: _userController.user.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: appliedJobs.length,
        itemBuilder: (BuildContext context, int index) {
          return AppliedJobCard(
            job: appliedJobs[index],
          );
        });
  }
}

class RequestedJobList extends StatefulWidget {
  const RequestedJobList({super.key});

  @override
  State<RequestedJobList> createState() => _RequestedJobListState();
}

class _RequestedJobListState extends State<RequestedJobList> {
  final JobController _jobController = JobController();

  @override
  void initState() {
    handleGetAppliedJobs();
    super.initState();
  }

  Future<void> handleGetAppliedJobs() async {
    await _jobController.getJobRequestList(status: 'Requested');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          itemCount: _jobController.jobRequestList.length,
          itemBuilder: (BuildContext context, int index) {
            return AppliedJobCard(
              job: _jobController.jobRequestList[index],
            );
          });
    });
  }
}
