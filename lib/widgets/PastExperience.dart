// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:ruralclap_app/constant/theme_color.dart';

class PastExperience extends StatelessWidget {
  const PastExperience({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: const [
              Image(
                  width: 60,
                  image: NetworkImage(
                      'https://brandlogovector.com/wp-content/uploads/2020/09/Uber-Logo.png')),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'iOS Team Lead',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.25,
                  color: ColorConstant.textPrimaryBlack,
                ),
              ),
              Text(
                'Uber',
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1.15,
                    fontWeight: FontWeight.w400),
              ),
              Text('Aug 2017 to Oct 2018'),
            ],
          )
        ],
      ),
    );
  }
}
