import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/widgets/AppliedJobCard.dart';
import 'package:ruralclap_app/widgets/ContactDetails.dart';
import 'package:ruralclap_app/widgets/PastExperience.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobs();
}

class _AppliedJobs extends State<AppliedJobs> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              color: ColorConstant.lightBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        IconButton(
                            onPressed: null,
                            icon: FaIcon(
                              FontAwesomeIcons.chevronLeft,
                              size: 20,
                              color: ColorConstant.textPrimaryBlack,
                            )),
                        Text(
                          'My Applied Jobs',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppliedJobCard(),
                    AppliedJobCard(),
                    AppliedJobCard(),
                    AppliedJobCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
