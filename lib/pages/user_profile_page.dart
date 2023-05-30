import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/utls/google_auth.dart';
import 'package:ruralclap_app/utls/routes.dart';
import 'package:ruralclap_app/widgets/ContactDetails.dart';
import 'package:ruralclap_app/widgets/PastExperience.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final UserController _userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: ColorConstant.textPrimaryWhite,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                GoogleAuth.signOutGoogle();
                Get.offAndToNamed(RoutesClass.loginPageRoute);
              },
              icon: const Icon(
                Icons.logout,
                color: ColorConstant.textPrimaryWhite,
                // size: 25,
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                RandomAvatar(_userController.user.name!,
                    height: 140, width: 140),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  _userController.user.name!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Something about me',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                if (_userController.user.isEmployer == false) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ColorConstant.primaryColor),
                            minimumSize:
                                MaterialStateProperty.all(const Size(150, 40)),
                          ),
                          onPressed: null,
                          child: const Text(
                            textAlign: TextAlign.center,
                            'Connect',
                            style: TextStyle(
                              color: ColorConstant.textPrimaryWhite,
                              fontSize: 16,
                              letterSpacing: 2.0,
                            ),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(const BorderSide(
                                color: ColorConstant.primaryColor,
                                width: 1,
                              )),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(150, 40)),
                              backgroundColor: const MaterialStatePropertyAll(
                                  ColorConstant.textPrimaryWhite)),
                          onPressed: null,
                          child: const Text(
                            textAlign: TextAlign.center,
                            'Message',
                            style: TextStyle(
                              color: ColorConstant.primaryColor,
                              fontSize: 16,
                              letterSpacing: 2.0,
                            ),
                          ))
                    ],
                  )
                ],
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    children: [
                      Card(
                          color: ColorConstant.textPrimaryWhite,
                          margin: const EdgeInsets.all(0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'About Me',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.02),
                                    ),
                                    IconButton(
                                        onPressed: null,
                                        constraints: BoxConstraints(),
                                        icon: FaIcon(
                                          FontAwesomeIcons.pen,
                                          size: 18,
                                          color: ColorConstant.textPrimaryBlack,
                                        ))
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  textAlign: TextAlign.justify,
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 12,
                      ),
                      Card(
                          color: ColorConstant.textPrimaryWhite,
                          margin: const EdgeInsets.all(0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _userController.user.isEmployer!
                                          ? "Jobs you Created in the Past"
                                          : "Past Experiences",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.02),
                                    ),
                                    IconButton(
                                        constraints: const BoxConstraints(),
                                        onPressed: () {
                                          _userController.user.isEmployer!
                                              ? Get.offAndToNamed(RoutesClass
                                                  .createJobPageRoute)
                                              : Get.offAndToNamed(
                                                  RoutesClass.layoutPageRoute);
                                        },
                                        icon: FaIcon(
                                          _userController.user.isEmployer!
                                              ? FontAwesomeIcons.plus
                                              : FontAwesomeIcons.pen,
                                          size: 18,
                                          color: ColorConstant.textPrimaryBlack,
                                        ))
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: Column(
                                    children: const [
                                      PastExperience(),
                                      PastExperience(),
                                      PastExperience(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 12,
                      ),
                      Card(
                          color: ColorConstant.textPrimaryWhite,
                          margin: const EdgeInsets.all(0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Basic Details',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.02),
                                    ),
                                    IconButton(
                                        onPressed: null,
                                        constraints: BoxConstraints(),
                                        icon: FaIcon(
                                          FontAwesomeIcons.pen,
                                          size: 18,
                                          color: ColorConstant.textPrimaryBlack,
                                        ))
                                  ],
                                ),
                                const SizedBox(height: 8),
                                ContactDetails()
                              ],
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
