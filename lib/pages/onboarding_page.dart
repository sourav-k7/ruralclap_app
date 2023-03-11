import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();
  final UserController _userController = Get.find<UserController>();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (_userController.user.email != null) {
      emailController.text = _userController.user.email!;
    }
  }

  String? user = "employer";
  String? name = "";
  String? language = "";
  String? location = "";
  String? contactNumber = "";
  String? emailId = "";
  String? gender = "";
  String? skills = "";
  String? expectedPay = "";
  String? description = "";
  bool? isEmployer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help Us Onboard You!",
          style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 18,
              color: ColorConstant.textPrimaryWhite,
              fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstant.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomRadioButton(
                    elevation: 0,
                    absoluteZeroSpacing: true,
                    width: 185,
                    defaultSelected: "employer",
                    unSelectedColor: ColorConstant.textPrimaryWhite,
                    buttonLables: const ['Employer', 'Service Provider'],
                    buttonValues: const [
                      'employer',
                      'service_provider',
                    ],
                    buttonTextStyle: const ButtonTextStyle(
                        selectedColor: ColorConstant.textPrimaryWhite,
                        unSelectedColor: ColorConstant.textPrimaryBlack,
                        textStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w400)),
                    radioButtonValue: (value) {
                      setState(() {
                        user = value;
                        value == "employer"
                            ? isEmployer = true
                            : isEmployer = false;
                      });
                    },
                    selectedColor: ColorConstant.primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.lightBackgroundColor,
                              width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.primaryColor, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.error, width: 2.0),
                        ),
                        labelText: "Name",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          color: ColorConstant.textPrimaryBlack,
                        ),
                        fillColor: ColorConstant.lightBackgroundColor,
                        focusColor: ColorConstant.lightBackgroundColor,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        language = value;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.lightBackgroundColor,
                              width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.primaryColor, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.error, width: 2.0),
                        ),
                        labelText: "Language",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          color: ColorConstant.textPrimaryBlack,
                        ),
                        fillColor: ColorConstant.lightBackgroundColor,
                        focusColor: ColorConstant.lightBackgroundColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        onChanged: (value) {
                          location = value;
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.lightBackgroundColor,
                                width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.primaryColor, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.error, width: 2.0),
                          ),
                          labelText: "Location",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            color: ColorConstant.textPrimaryBlack,
                          ),
                          fillColor: ColorConstant.lightBackgroundColor,
                          focusColor: ColorConstant.lightBackgroundColor,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        contactNumber = value;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.lightBackgroundColor,
                              width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.primaryColor, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.error, width: 2.0),
                        ),
                        labelText: "Mobile Number",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          color: ColorConstant.textPrimaryBlack,
                        ),
                        fillColor: ColorConstant.lightBackgroundColor,
                        focusColor: ColorConstant.lightBackgroundColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.lightBackgroundColor,
                              width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.primaryColor, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.error, width: 2.0),
                        ),
                        labelText: "Email Id",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          color: ColorConstant.textPrimaryBlack,
                        ),
                        fillColor: ColorConstant.lightBackgroundColor,
                        focusColor: ColorConstant.lightBackgroundColor,
                      ),
                      readOnly: true,
                      enabled: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        onChanged: (value) {
                          gender = value;
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.lightBackgroundColor,
                                width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.primaryColor, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.error, width: 2.0),
                          ),
                          labelText: "Gender",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            color: ColorConstant.textPrimaryBlack,
                          ),
                          fillColor: ColorConstant.lightBackgroundColor,
                          focusColor: ColorConstant.lightBackgroundColor,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    if (user == "service_provider") ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                              onChanged: (value) {
                                skills = value;
                              },
                              decoration: const InputDecoration(
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.lightBackgroundColor,
                                      width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.primaryColor,
                                      width: 2.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.error, width: 2.0),
                                ),
                                labelText: "Skills",
                                hintText:
                                    "Please enter ',' (comma) seperated skills",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                  color: ColorConstant.textPrimaryBlack,
                                ),
                                fillColor: ColorConstant.lightBackgroundColor,
                                focusColor: ColorConstant.lightBackgroundColor,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                    if (user == "service_provider") ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                              onChanged: (value) {
                                expectedPay = value;
                              },
                              decoration: const InputDecoration(
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.lightBackgroundColor,
                                      width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.primaryColor,
                                      width: 2.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.error, width: 2.0),
                                ),
                                labelText: "Expected Pay",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                  color: ColorConstant.textPrimaryBlack,
                                ),
                                fillColor: ColorConstant.lightBackgroundColor,
                                focusColor: ColorConstant.lightBackgroundColor,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                    TextFormField(
                        onChanged: (value) {
                          description = value;
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.lightBackgroundColor,
                                width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.primaryColor, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.error, width: 2.0),
                          ),
                          labelText: "Description",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            color: ColorConstant.textPrimaryBlack,
                          ),
                          fillColor: ColorConstant.lightBackgroundColor,
                          focusColor: ColorConstant.lightBackgroundColor,
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        {}
                      },
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(Size(360, 50))),
                      child: const Text('Submit'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
