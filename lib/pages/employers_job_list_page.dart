import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/job.dart';
import 'package:ruralclap_app/utls/routes.dart';
import 'package:ruralclap_app/widgets/Applied_Job_Card.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';

class EmployerJobPage extends StatefulWidget {
  const EmployerJobPage({super.key});

  @override
  State<EmployerJobPage> createState() => _EmployerJobPage();
}

class _EmployerJobPage extends State<EmployerJobPage> {
  final UserController _userController = Get.find<UserController>();
  final JobController _jobController = JobController();

  @override
  void initState() {
    super.initState();

    if (_userController.user.email != null) {
      int employerId = _userController.user.id!;
      _jobController.listEmployerJobs(employerId: employerId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        elevation: 0,
        title: const Text(
          'Jobs You Created in the Past',
          style: TextStyle(
            color: ColorConstant.textPrimaryWhite,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            color: ColorConstant.lightBackgroundColor,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _jobController.employerJobList.map((job) {
                  return AppliedJobCard(
                    job: job,
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 5, 20),
        child: SizedBox(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            mini: false,
            onPressed: () {
              Get.toNamed(RoutesClass.createJobPageRoute,
                  arguments: {'status': 'Hiring'});
            },
            backgroundColor: ColorConstant.primaryColor,
            child: const FaIcon(
              FontAwesomeIcons.plus,
              size: 30,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
