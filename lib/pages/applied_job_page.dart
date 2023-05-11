import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/job.dart';
import 'package:ruralclap_app/utls/routes.dart';
import 'package:ruralclap_app/widgets/AppliedJobCard.dart';
import 'package:ruralclap_app/constant/classes.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobs();
}

class _AppliedJobs extends State<AppliedJobs> {
  final UserController _userController = Get.find<UserController>();
  final JobController _jobController = JobController();
  List<Job> Jobs = [];

  @override
  void initState() {
    super.initState();
    final user = _userController.user;
    final userId = user.id;
    if (user.isEmployer != true) {
      serviceProviderGrabber(userId!);
    } else {
      employerGrabber(userId!);
    }
  }

  Future<void> serviceProviderGrabber(int userId) async {
    final url =
        'http://192.168.0.181:8000/users/service-provider/$userId/applied-jobs/'; //keep in mind to change the ip address

    final response = await http.get(Uri.parse(url));
    final responseData = response.body;
    final List<dynamic> jobData = json.decode(responseData);
    List<Job> _jobs = [];

    for (var jobJson in jobData) {
      Job job = Job(
        jobTitle: jobJson['title'],
        applicationStatus: jobJson['status'],
        createdDate: DateTime.parse(jobJson['created_date']),
        // applicants: jobJson['applicants'], (future scope)
      );

      _jobs.add(job);
    }

    setState(() {
      Jobs = _jobs;
    });
  }

  Future<void> employerGrabber(int userId) async {
    final url =
        'http://192.168.0.181:8000/users/employer/$userId/created-jobs/'; //remember to change ip address

    final response = await http.get(Uri.parse(url));
    final responseData = response.body;
    final List<dynamic> jobData = json.decode(responseData);
    List<Job> _jobs = [];

    for (var jobJson in jobData) {
      Job job = Job(
        jobTitle: jobJson['title'],
        applicationStatus: jobJson['status'],
        createdDate: DateTime.parse(jobJson['created_date']),
      );

      _jobs.add(job);
    }

    setState(() {
      Jobs = _jobs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _getFAB() {
      if (_userController.user.isEmployer!) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 5, 20),
          child: SizedBox(
            width: 65,
            height: 65,
            child: FloatingActionButton(
              mini: false,
              onPressed: () {
                Get.toNamed(RoutesClass.createJobPageRoute);
              },
              backgroundColor: ColorConstant.primaryColor,
              child: const FaIcon(
                FontAwesomeIcons.plus,
                size: 30,
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _userController.user.isEmployer!
              ? 'Jobs You Created in the Past'
              : 'My Applied Jobs',
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: ColorConstant.textPrimaryBlack,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5),
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
              children: Jobs.map((job) => AppliedJobCard(
                    job: job,
                  )).toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: _getFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
