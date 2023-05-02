import 'package:flutter/material.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/models/user.dart';
import 'package:ruralclap_app/utls/TextField_Validator.dart';
import 'package:ruralclap_app/utls/routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();
  final UserController _userController = Get.find<UserController>();
  TextEditingController emailController = TextEditingController();
  final User _user = User();
  var isCreatingUser = false;

  @override
  void initState() {
    super.initState();

    if (_userController.user.email != null) {
      emailController.text = _userController.user.email!;
      _user.email = _userController.user.email!;
    }
    _user.isEmployer = true;
  }

  String? user = "employer";

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
                        user == "employer"
                            ? _user.isEmployer = true
                            : _user.isEmployer = false;
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
                      validator: (input) {
                        String? error;
                        error = FormFieldValidate.isEmpty(input ?? '');
                        return error;
                      },
                      onChanged: (value) {
                        _user.name = value;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.lightBackgroundColor,
                              width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.primaryColor, width: 1.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.error, width: 1.5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.error, width: 1.5),
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
                        _user.language = value;
                      },
                      validator: (input) {
                        String? error;
                        error = FormFieldValidate.isEmpty(input ?? '');
                        return error;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.lightBackgroundColor,
                              width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.primaryColor, width: 1.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.error, width: 1.5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.error, width: 1.5),
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
                          _user.location = value;
                        },
                        validator: (input) {
                          String? error;
                          error = FormFieldValidate.isEmpty(input ?? '');
                          return error;
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
                          focusedErrorBorder: OutlineInputBorder(
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
                        _user.phone = int.parse(value);
                      },
                      validator: (input) {
                        String? error;
                        error = FormFieldValidate.isEmpty(input ?? '');
                        error = FormFieldValidate.isPhoneNo(input ?? '');
                        return error;
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
                        focusedErrorBorder: OutlineInputBorder(
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
                        focusedErrorBorder: OutlineInputBorder(
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
                        validator: (input) {
                          String? error;
                          error = FormFieldValidate.isEmpty(input ?? '');
                          return error;
                        },
                        onChanged: (value) {
                          _user.gender = value;
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
                          focusedErrorBorder: OutlineInputBorder(
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
                      height: 15,
                    ),
                    if (user == "service_provider") ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                              validator: (input) {
                                String? error;
                                error = FormFieldValidate.isEmpty(input ?? '');
                                return error;
                              },
                              onChanged: (value) {
                                _user.skills = value;
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
                                focusedErrorBorder: OutlineInputBorder(
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
                          TextFormField(
                              validator: (input) {
                                String? error;
                                error = FormFieldValidate.isEmpty(input ?? '');
                                return error;
                              },
                              onChanged: (value) {
                                _user.expectedPayment = int.parse(value);
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
                                focusedErrorBorder: OutlineInputBorder(
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
                          TextFormField(
                              validator: (input) {
                                String? error;
                                error = FormFieldValidate.isEmpty(input ?? '');
                                return error;
                              },
                              onChanged: (value) {
                                _user.category = value;
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.error, width: 2.0),
                                ),
                                labelText: "Job Category",
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
                          TextFormField(
                              validator: (input) {
                                String? error;
                                error = FormFieldValidate.isEmpty(input ?? '');
                                return error;
                              },
                              onChanged: (value) {
                                _user.age = int.parse(value);
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.error, width: 2.0),
                                ),
                                labelText: "Age",
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
                          TextFormField(
                              validator: (input) {
                                String? error;
                                error = FormFieldValidate.isEmpty(input ?? '');
                                return error;
                              },
                              onChanged: (value) {
                                _user.education = value;
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.error, width: 2.0),
                                ),
                                labelText: "Education",
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
                          TextFormField(
                              validator: (input) {
                                String? error;
                                error = FormFieldValidate.isEmpty(input ?? '');
                                return error;
                              },
                              onChanged: (value) {
                                _user.experience = value;
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstant.error, width: 2.0),
                                ),
                                labelText: "Experience",
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
                        validator: (input) {
                          String? error;
                          error = FormFieldValidate.isEmpty(input ?? '');
                          return error;
                        },
                        onChanged: (value) {
                          _user.description = value;
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
                          focusedErrorBorder: OutlineInputBorder(
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
                      onPressed: () async {
                        setState(() {
                          isCreatingUser = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          await _userController.createUser(userData: _user);
                        }
                        setState(() {
                          isCreatingUser = false;
                        });
                        Get.offAndToNamed(RoutesClass.layoutPageRoute);
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
