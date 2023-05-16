import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/pages/service_provider_list_page.dart';

class ServiceProviderJobDetailPage extends StatelessWidget {
  ServiceProviderJobDetailPage({super.key});

  final Job _job = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: ColorConstant.textPrimaryBlack),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Job Detail Page",
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
      body: Column(
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
                fontSize: 18,
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
        ],
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
              color: Colors.grey,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              category,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
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
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 18,
                ),
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.add_location,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: ' $location',
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 18,
                ),
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.wallet_outlined,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: ' $expectedPay',
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 18,
                ),
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.check_box_outlined,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: ' $skills',
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 18,
                ),
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.description_outlined,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: ' $description',
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
