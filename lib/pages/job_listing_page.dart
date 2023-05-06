import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/job.dart';
import '/widgets/job_card.dart';

class JobListing extends StatefulWidget {
  JobListing({super.key});
  @override
  State<JobListing> createState() => _JobListingState();
}

class _JobListingState extends State<JobListing> {
  final JobController _jobController = Get.find<JobController>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _jobController.getJobList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Jobs",
          style: TextStyle(
            color: ColorConstant.textPrimaryBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SearchBar(),

            const SizedBox(height: 15.0),
            //apply padding to some sides only
            const Text(
              "Jobs based on your profile",
              style: TextStyle(
                color: ColorConstant.textPrimaryBlack,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 15.0),
            Obx(
              () => isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: _jobController.categoryJobList
                          .map((job) => JobCard(
                                job: job,
                              ))
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
