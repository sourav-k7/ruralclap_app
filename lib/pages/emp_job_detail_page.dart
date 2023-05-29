import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/job.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/pages/service_provider_list_page.dart';
import 'package:ruralclap_app/widgets/Service_Provider_card.dart';

class EmpJobDetailPage extends StatefulWidget {
  const EmpJobDetailPage({super.key});

  @override
  State<EmpJobDetailPage> createState() => _EmpJobDetailPageState();
}

class _EmpJobDetailPageState extends State<EmpJobDetailPage> {
  final Job _job = Get.arguments;
  final JobController _jobController = Get.find<JobController>();

  @override
  void initState() {
    if (_job.status == 'Hiring') {
      _jobController.getJobApplicantList(jobId: _job.id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorConstant.textPrimaryWhite,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Job Detail Page",
          style: TextStyle(
            color: ColorConstant.textPrimaryWhite,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        backgroundColor: ColorConstant.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CompanyCard(
              title: _job.title!,
              category: _job.category!,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Job Details",
                style: TextStyle(
                  color: ColorConstant.textPrimaryBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CompanyCardDetailed(
              location: _job.location!,
              description: _job.description!,
              expectedPay: _job.pay!.toString(),
              skills: _job.requiredSkills!,
            ),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _job.status == 'Hiring'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Applicant",
                            style: TextStyle(
                              color: ColorConstant.textPrimaryBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => _jobController.isLoading.value
                                ? const CircularProgressIndicator()
                                : Column(
                                    children: _jobController.applicantList
                                        .map((user) => ServiceProviderCard(
                                              name: user.name ?? '',
                                              jobTitle: user.category ?? '',
                                              description:
                                                  user.description ?? '',
                                              rating: user.rating ?? 0,
                                              onHire: () async {
                                                await _jobController.jobAction(
                                                    status: 'In Progress',
                                                    jobId: _job.id!,
                                                    userId: user.id!);
                                                setState(() {
                                                  _job.status = 'In Progress';
                                                  _job.serviceProvider?.name =
                                                      user.name;
                                                  _job.serviceProvider
                                                          ?.category =
                                                      user.category;
                                                  _job.serviceProvider
                                                          ?.description =
                                                      user.description;
                                                  _job.serviceProvider?.rating =
                                                      user.rating;
                                                });
                                              },
                                            ))
                                        .toList()),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _job.status == 'In Progress'
                                ? "Hired Service provider"
                                : "Requested Service Provider",
                            style: const TextStyle(
                              color: ColorConstant.textPrimaryBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ServiceProviderCard(
                            name: _job.serviceProvider!.name ?? '',
                            jobTitle: _job.serviceProvider!.category ?? '',
                            description:
                                _job.serviceProvider!.description ?? '',
                            rating: _job.serviceProvider!.rating ?? 0,
                          )
                        ],
                      ))
          ],
        ),
      ),
    );
  }
}

class CompanyCard extends StatelessWidget {
  CompanyCard({super.key, required this.title, required this.category});
  String title, category;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.business,
              size: 45,
              color: ColorConstant.textPrimaryBlack,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorConstant.textPrimaryBlack,
              ),
            ),
            Text(
              category,
              style: const TextStyle(
                fontSize: 15,
                color: ColorConstant.textBody,
              ),
            ),
          ],
        ));
  }
}

class CompanyCardDetailed extends StatelessWidget {
  CompanyCardDetailed(
      {super.key,
      required this.location,
      required this.expectedPay,
      required this.skills,
      required this.description});
  String location, expectedPay, skills, description;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Location:',
              style: TextStyle(color: ColorConstant.textBody),
            ),
            Text(
              location,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Pay:',
              style: TextStyle(color: ColorConstant.textBody),
            ),
            Text(
              '₹ $expectedPay',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Required Skills:',
              style: TextStyle(color: ColorConstant.textBody),
            ),
            Text(
              skills,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Job Description:',
              style: TextStyle(color: ColorConstant.textBody),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ));
  }
}
