import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:ruralclap_app/constant/job_category.dart';
import 'package:ruralclap_app/utls/routes.dart';
import 'package:ruralclap_app/widgets/serviceProviderCard.dart';

class ServiceProviderListPage extends StatefulWidget {
  ServiceProviderListPage({super.key});

  @override
  State<ServiceProviderListPage> createState() =>
      _ServiceProviderListPageState();
}

class _ServiceProviderListPageState extends State<ServiceProviderListPage> {
  final UserController _userController = Get.find<UserController>();
  bool isLoading = false;
  var selectedCategory = 'Beautician';

  @override
  void initState() {
    super.initState();
    _userController.getServiceProviderReco(
      language: _userController.user.language ?? 'Hindi',
      location: _userController.user.location ?? "Pune",
      category: selectedCategory,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: jobCategory.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.primaryColor,
          elevation: 0,
          title: const Text(
            'Hire Service Provider',
            style: TextStyle(
              color: ColorConstant.textPrimaryWhite,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          bottom: TabBar(
            onTap: (index) async {
              selectedCategory = jobCategory[index];
              setState(() {
                isLoading = true;
              });
              await _userController.getServiceProviderReco(
                language: _userController.user.language ?? 'Hindi',
                location: _userController.user.location ?? "Pune",
                category: jobCategory[index],
              );
              setState(() {
                isLoading = false;
              });
            },
            isScrollable: true,
            indicatorColor: ColorConstant.secondaryColor,
            tabs: jobCategory
                .map((job) => Tab(
                      child: Text(job),
                    ))
                .toList(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => isLoading
                    ? const CircularProgressIndicator()
                    : Column(
                        children: _userController.recoServiceProvider
                            .map((user) => ServiceProviderCard(
                                  name: user.name ?? '',
                                  jobTitle: user.category ?? '',
                                  description: user.description ?? '',
                                  rating: user.rating ?? 0,
                                  onHire: () {
                                    Get.toNamed(RoutesClass.createJobPageRoute,
                                        arguments: {
                                          'status': 'Requested',
                                          'userId': user.id!
                                        });
                                  },
                                ))
                            .toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
