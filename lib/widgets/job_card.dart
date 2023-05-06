import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/utls/routes.dart';

class JobCard extends StatelessWidget {
  JobCard({
    super.key,
    required this.job,
  });
  Job job;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 3,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Hero(
            tag: 'ListTile-Hero',
            // Wrap the ListTile in a Material widget so the ListTile has someplace
            // to draw the animated colors during the hero transition.
            child: Material(
              child: ListTile(
                leading: const Icon(Icons.business, size: 45),
                title: Text(job.title!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(job.category!),
                    Text(
                      'Location: ${job.location}    Expected pay: ${job.pay}',
                    ),
                    Text('Skills: ${job.requiredSkills}'),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                isThreeLine: true,
                onTap: () {
                  Get.toNamed(RoutesClass.jobInformationPageRoute);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
