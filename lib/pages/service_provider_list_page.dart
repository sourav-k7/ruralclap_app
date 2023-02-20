import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ruralclap_app/constant/theme_color.dart';

class EmpDetail {
  String name;
  String jobTitle;
  double rating;
  String description;
  EmpDetail({
    required this.name,
    required this.jobTitle,
    required this.rating,
    required this.description,
  });
}

class ServiceProviderListPage extends StatelessWidget {
  const ServiceProviderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var serviceProviderList = [
      EmpDetail(
        name: 'Username',
        jobTitle: 'Flutter developer',
        rating: 5.0,
        description: 'Small Job Description',
      ),
      EmpDetail(
        name: 'Username 2',
        jobTitle: 'Flutter developer',
        rating: 5.0,
        description: 'Small Job Description',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ColorConstant.textBody,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hire Service Provider',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...serviceProviderList
                .map((emp) => ServiceProviderCard(
                      detail: emp,
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}

class ServiceProviderCard extends StatelessWidget {
  const ServiceProviderCard({super.key, required this.detail});

  final EmpDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 2,
            color: ColorConstant.borderGrey,
          )),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: ColorConstant.borderGrey,
            ),
          ),
          child: const Icon(
            Icons.person_outline,
            color: ColorConstant.textBody,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                detail.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                detail.jobTitle,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Rating: ${detail.rating}',
              ),
              Text(
                detail.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text('Hire me'),
        )
      ]),
    );
  }
}
