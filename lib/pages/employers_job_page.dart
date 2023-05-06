import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/job.dart';
import 'package:ruralclap_app/utls/routes.dart';
import 'package:ruralclap_app/widgets/AppliedJobCard.dart';
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
      int? employerId = _userController.user.id;
      _jobController.listEmployerJobs(employerId: employerId);
    }
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
              children: []
                  .map((job) => AppliedJobCard(
                        job: job,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: _getFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
