import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/classes.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:intl/intl.dart';
import 'package:ruralclap_app/pages/job_information.dart';

class AppliedJobCard extends StatelessWidget {
  final Job job;
  const AppliedJobCard({required this.job});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<Widget>(builder: (BuildContext context) {
            return job_information();
          }),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.postName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.25,
                          color: ColorConstant.textPrimaryBlack,
                        ),
                      ),
                      Text(
                        job.companyName,
                        style: const TextStyle(
                            fontSize: 14,
                            letterSpacing: 1.15,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image(width: 40, image: NetworkImage(job.companyLogo)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstant.lightBackgroundColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: FaIcon(
                        FontAwesomeIcons.bolt,
                        size: 18,
                      ),
                      onPressed: null,
                    ),
                    Text(
                      job.applicationStatus,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.25,
                        backgroundColor: ColorConstant.lightBackgroundColor,
                        color: ColorConstant.textPrimaryBlack,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: null,
                              icon: FaIcon(
                                FontAwesomeIcons.calendar,
                                size: 20,
                              )),
                          Text(
                            'Applied on ${DateFormat.yMMMd().format(job.appliedDate).toString()}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.02,
                              color: ColorConstant.textPrimaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: null,
                              icon: FaIcon(
                                FontAwesomeIcons.userGroup,
                                size: 16,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${job.numberOfApplicants} Applicants',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
