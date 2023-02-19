// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/widgets/ContactDetails.dart';
import 'package:ruralclap_app/widgets/PastExperience.dart';

class SPProfilePage extends StatefulWidget {
  const SPProfilePage({super.key});

  @override
  State<SPProfilePage> createState() => _SPProfilePage();
}

class _SPProfilePage extends State<SPProfilePage> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: null,
                          icon: FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            color: Colors.black,
                            size: 20,
                          )),
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
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/5b/23/9c/5b239c2428af9b5ec230bdf830251adb.jpg'),
                            radius: 90,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Kakashi Hatake',
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
                  ),
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
                                    "I want to write anything i can here while im adesigning the card this is nothing but a place holder you can think of it as a lorem epsum that i typed because i got bored coding hahahahaha",
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
                                        'Past Experiences',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1.02),
                                      ),
                                      IconButton(
                                          onPressed: null,
                                          icon: FaIcon(
                                            FontAwesomeIcons.pen,
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
                                        'Contact Details',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1.02),
                                      ),
                                      IconButton(
                                          onPressed: null,
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
