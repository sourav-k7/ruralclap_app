import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/widgets/AppliedJobCard.dart';
import 'package:ruralclap_app/widgets/ContactDetails.dart';
import 'package:ruralclap_app/widgets/PastExperience.dart';
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
        numberOfApplicants: 448)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            constraints: const BoxConstraints(),
            icon: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              size: 20,
              color: ColorConstant.textPrimaryBlack,
            )),
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
