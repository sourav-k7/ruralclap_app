import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:ruralclap_app/constant/job_category.dart';

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
                color: ColorConstant.textPrimaryBlack,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: ColorConstant.primaryColor,
              ),
              style: const TextStyle(
                fontSize: 16,
                color: ColorConstant.textBody,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(10),
                filled: true,
                hintText: 'Select your job category',
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: ColorConstant.textBody,
                ),
                fillColor: ColorConstant.lightBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (String? value) async {
                selectedCategory = value ?? '';
                setState(() {
                  isLoading = true;
                });
                await _userController.getServiceProviderReco(
                  language: _userController.user.language ?? 'Hindi',
                  location: _userController.user.location ?? "Pune",
                  category: value ?? '',
                );
                setState(() {
                  isLoading = false;
                });
              },
              items: jobCategory.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: _userController.recoServiceProvider
                        .map((user) => ServiceProviderCard(
                              name: user.name!,
                              jobTitle: user.category!,
                              description: user.description!,
                              rating: user.rating!,
                            ))
                        .toList())
          ],
        ),
      ),
    );
  }
}

class ServiceProviderCard extends StatelessWidget {
  const ServiceProviderCard(
      {super.key,
      required this.name,
      required this.jobTitle,
      required this.description,
      required this.rating});

  final String name, jobTitle, description;
  final double rating;

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
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                jobTitle,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Rating: $rating',
              ),
              Text(
                description,
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
