import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';

class AppliedJobCard extends StatelessWidget {
  const AppliedJobCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  children: const [
                    Text(
                      'iOS Team Lead',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.25,
                        color: ColorConstant.textPrimaryBlack,
                      ),
                    ),
                    Text(
                      'Vernacular Internet Private Limited',
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1.15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Image(
                        width: 60,
                        image: NetworkImage(
                            'https://brandlogovector.com/wp-content/uploads/2020/09/Uber-Logo.png')),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorConstant.lightBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: FaIcon(
                      FontAwesomeIcons.bolt,
                      size: 18,
                    ),
                    onPressed: null,
                  ),
                  Text(
                    'Selected',
                    style: TextStyle(
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
                      children: const [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: null,
                            icon: FaIcon(
                              FontAwesomeIcons.calendar,
                              size: 18,
                            )),
                        Text(
                          'Applied on 14th May',
                          style: TextStyle(
                            fontSize: 14,
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
                      children: const [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: null,
                            icon: FaIcon(
                              FontAwesomeIcons.userGroup,
                              size: 16,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '448 Applicants',
                          style: TextStyle(
                            fontSize: 16,
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
    );
  }
}
