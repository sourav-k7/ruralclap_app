import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/utls/routes.dart';

class AppliedJobCard extends StatelessWidget {
  final Job job;
  AppliedJobCard({super.key, required this.job});
  final UserController _userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_userController.user.isEmployer!) {
          Get.toNamed(RoutesClass.empJobDetailPage, arguments: job);
        } else {
          Get.toNamed(RoutesClass.serviceProviderJobDetailPage, arguments: job);
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
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
                        job.title!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.25,
                          color: ColorConstant.textPrimaryBlack,
                        ),
                      ),
                      Text(
                        job.category ?? '',
                        style: const TextStyle(
                          letterSpacing: 1.15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.business, size: 45)
                ],
              ),
              Container(
                width: 120,
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
                      job.status!,
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
              // const SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Column(
              //       children: [
              //         Row(
              //           children: const [
              //             IconButton(
              //                 padding: EdgeInsets.zero,
              //                 constraints: BoxConstraints(),
              //                 onPressed: null,
              //                 icon: FaIcon(
              //                   FontAwesomeIcons.calendar,
              //                   size: 20,
              //                 )),
              //             Text(
              //               'Applied on date',
              //               // ${DateFormat.yMMMd().format(job.appliedDate).toString()}',
              //               style: TextStyle(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w400,
              //                 letterSpacing: 1.02,
              //                 color: ColorConstant.textPrimaryBlack,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         Row(
              //           children: const [
              //             IconButton(
              //                 padding: EdgeInsets.zero,
              //                 constraints: BoxConstraints(),
              //                 onPressed: null,
              //                 icon: FaIcon(
              //                   FontAwesomeIcons.userGroup,
              //                   size: 16,
              //                 )),
              //             SizedBox(
              //               width: 5,
              //             ),
              //             Text(
              //               '0 Applicants',
              //               style: TextStyle(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w400,
              //                 letterSpacing: 1.5,
              //               ),
              //             )
              //           ],
              //         ),
              //       ],
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
