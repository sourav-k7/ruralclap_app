import 'package:flutter/material.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/widgets/AppliedJobCard.dart';
import 'package:ruralclap_app/constant/classes.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobs();
}

class _AppliedJobs extends State<AppliedJobs> {
  List<Job> Jobs = [
    Job(
        postName: "iOS Team Lead",
        companyName: "Uber",
        companyLogo:
            "https://brandlogovector.com/wp-content/uploads/2020/09/Uber-Logo.png",
        applicationStatus: "Selected",
        appliedDate: DateTime(2023, 5, 14),
        numberOfApplicants: 448),
    Job(
        postName: "Technical Support Engineer",
        companyName: "SurveyMonkey",
        companyLogo:
            "https://brandlogovector.com/wp-content/uploads/2020/09/Uber-Logo.png",
        applicationStatus: "Selected",
        appliedDate: DateTime(2023, 7, 12),
        numberOfApplicants: 412),
    Job(
        postName: "Associate Software Engineer",
        companyName: "Searce",
        companyLogo:
            "https://brandlogovector.com/wp-content/uploads/2020/09/Uber-Logo.png",
        applicationStatus: "Selected",
        appliedDate: DateTime(2023, 8, 4),
        numberOfApplicants: 486),
    Job(
        postName: "Product Manager",
        companyName: "Cockatoo",
        companyLogo:
            "https://brandlogovector.com/wp-content/uploads/2020/09/Uber-Logo.png",
        applicationStatus: "Selected",
        appliedDate: DateTime(2023, 9, 24),
        numberOfApplicants: 812)
  ];

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
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        backgroundColor: ColorConstant.lightBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
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
    );
  }
}
