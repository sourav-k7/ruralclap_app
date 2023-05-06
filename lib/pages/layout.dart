import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/job.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:ruralclap_app/pages/applied_job_page.dart';
import 'package:ruralclap_app/pages/home_page.dart';
import 'package:ruralclap_app/pages/service_provider_list_page.dart';
import 'package:ruralclap_app/pages/user_profile_page.dart';
import 'package:ruralclap_app/pages/job_listing_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static final UserController _userController = Get.find<UserController>();
  final JobController _jobController = Get.put(JobController());
  final serviceProviderPages = <Widget>[
    JobListing(),
    AppliedJobs(),
    const MyHomePage(),
    ProfilePage(),
  ];
  final employerPages = <Widget>[
    ServiceProviderListPage(),
    AppliedJobs(),
    ProfilePage(),
    const MyHomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<BottomNavigationBarItem> serviveProviderNavItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.work),
      label: 'Jobs',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.folder),
      label: 'My Jobs',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_rounded),
      label: 'Profile',
    ),
  ];

  static const List<BottomNavigationBarItem> employerNavItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.work),
      label: 'Service Provider',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.folder),
      label: 'My Jobs',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_rounded),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
  ];

  // static final List<BottomNavigationBarItem> navBarItem =

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = _userController.user.isEmployer == true
        ? employerPages
        : serviceProviderPages;
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: ColorConstant.primaryColor,
        unselectedItemColor: Colors.grey,
        items: _userController.user.isEmployer == true
            ? employerNavItems
            : serviveProviderNavItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
