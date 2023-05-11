import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/job.dart';
import 'package:ruralclap_app/utls/routes.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobs();
}

class _AppliedJobs extends State<AppliedJobs> {
  final UserController _userController = Get.find<UserController>();
  final JobController _jobController = JobController();
  // List<Job> Jobs = [
  //   Job(
  //       postName: "iOS Team Lead",
  //       companyName: "Uber",
  //       companyLogo:
  //           "https://brandlogovector.com/wp-content/uploads/2020/09/Uber-Logo.png",
  //       applicationStatus: "Selected",
  //       appliedDate: DateTime(2023, 5, 14),
  //       numberOfApplicants: 448),
  //   Job(
  //       postName: "Technical Support Engineer",
  //       companyName: "SurveyMonkey",
  //       companyLogo:
  //           "https://brandlogovector.com/wp-content/uploads/2020/09/Uber-Logo.png",
  //       applicationStatus: "Selected",
  //       appliedDate: DateTime(2023, 7, 12),
  //       numberOfApplicants: 412),
  //   Job(
  //       postName: "Associate Software Engineer",
  //       companyName: "Searce",
  //       companyLogo:
  //           "https://brandlogovector.com/wp-content/uploads/2020/09/Uber-Logo.png",
  //       applicationStatus: "Selected",
  //       appliedDate: DateTime(2023, 8, 4),
  //       numberOfApplicants: 486),
  //   Job(
  //       postName: "Product Manager",
  //       companyName: "Cockatoo",
  //       companyLogo:
  //           "https://brandlogovector.com/wp-content/uploads/2020/09/Uber-Logo.png",
  //       applicationStatus: "Selected",
  //       appliedDate: DateTime(2023, 9, 24),
  //       numberOfApplicants: 812)
  // ];

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
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 5),
      //     child: Container(
      //       color: ColorConstant.lightBackgroundColor,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: []
      //             .map((job) => AppliedJobCard(
      //                   job: job,
      //                 ))
      //             .toList(),
      //       ),
      //     ),
      //   ),
      // ),
      floatingActionButton: _getFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
