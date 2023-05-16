import 'package:flutter/material.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/job.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/widgets/AppliedJobCard.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobs();
}

class _AppliedJobs extends State<AppliedJobs> {
  final UserController _userController = Get.find<UserController>();
  final JobController _jobController = JobController();
  List<Job> jobs = [];

  @override
  void initState() {
    handleGetJobs();
    super.initState();
  }

  Future<void> handleGetJobs() async {
    jobs = await _jobController.getAllUserAppliedJob(
        userId: _userController.user.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Applied Jobs',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.textPrimaryBlack,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConstant.lightBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            color: ColorConstant.lightBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: jobs
                  .map((job) => AppliedJobCard(
                        job: job,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
