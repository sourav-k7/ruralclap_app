// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/utls/routes.dart';
import 'package:ruralclap_app/widgets/ContactDetails.dart';
import 'package:ruralclap_app/widgets/PastExperience.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              color: ColorConstant.lightBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: FaIcon(
                              FontAwesomeIcons.solidBell,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConstant.textPrimaryWhite),
                            child: IconButton(
                                onPressed: null,
                                icon: FaIcon(
                                  FontAwesomeIcons.ellipsis,
                                  color: Colors.black,
                                  size: 20,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/images/${_userController.user.gender!.toLowerCase()}-avatar.png"),
                            radius: 90,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            _userController.user.name!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Ded Sau Rupya lega',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
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
                              minimumSize: MaterialStateProperty.all(
                                  const Size(150, 40)),
                            ),
                            onPressed: null,
                            child: Text(
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
                                side: MaterialStateProperty.all(BorderSide(
                                  color: ColorConstant.primaryColor,
                                  width: 1,
                                )),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(150, 40)),
                                backgroundColor: MaterialStatePropertyAll(
                                    ColorConstant.textPrimaryWhite)),
                            onPressed: null,
                            child: Text(
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
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      children: [
                        Card(
                            color: ColorConstant.textPrimaryWhite,
                            margin: EdgeInsets.all(0),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(18, 10, 18, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                                            color:
                                                ColorConstant.textPrimaryBlack,
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    textAlign: TextAlign.justify,
                                    _userController.user.description!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Card(
                            color: ColorConstant.textPrimaryWhite,
                            margin: EdgeInsets.all(0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _userController.user.isEmployer!
                                            ? "Jobs you Created in the Past"
                                            : "Past Experiences",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1.02),
                                      ),
                                      IconButton(
                                          constraints: BoxConstraints(),
                                          onPressed: () {
                                            _userController.user.isEmployer!
                                                ? Get.offAndToNamed(RoutesClass
                                                    .createJobPageRoute)
                                                : Get.offAndToNamed(RoutesClass
                                                    .layoutPageRoute);
                                          },
                                          icon: FaIcon(
                                            _userController.user.isEmployer!
                                                ? FontAwesomeIcons.plus
                                                : FontAwesomeIcons.pen,
                                            size: 18,
                                            color:
                                                ColorConstant.textPrimaryBlack,
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: Column(
                                      children: [
                                        PastExperience(),
                                        PastExperience(),
                                        PastExperience(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Card(
                            color: ColorConstant.textPrimaryWhite,
                            margin: EdgeInsets.all(0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                                            color:
                                                ColorConstant.textPrimaryBlack,
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: 8),
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
      ),
    );
  }
}
