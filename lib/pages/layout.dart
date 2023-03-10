import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:ruralclap_app/pages/applied_job_page.dart';
import 'package:ruralclap_app/pages/user_profile_page.dart';
import 'package:ruralclap_app/pages/job_listing_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static final UserController _userController = Get.find<UserController>();
  static final serviceProviderPages = <Widget>[
    JobListing(),
    AppliedJobs(),
    ProfilePage(),
  ];
  static final employerPages = <Widget>[
    AppliedJobs(),
    ProfilePage(),
  ];
  static final List<Widget> _widgetOptions =
      _userController.user.isEmployer == true
          ? employerPages
          : serviceProviderPages;

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
      icon: Icon(Icons.folder),
      label: 'My Jobs',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_rounded),
      label: 'Profile',
    ),
  ];

  static final List<BottomNavigationBarItem> navBarItem =
      _userController.user.isEmployer == true
          ? employerNavItems
          : serviveProviderNavItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: ColorConstant.primaryColor,
        unselectedItemColor: Colors.grey,
        items: navBarItem,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
