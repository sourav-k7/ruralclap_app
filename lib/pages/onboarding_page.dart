import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();

  String? user = "employer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Service Provider",
          style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 18,
              color: ColorConstant.textPrimaryWhite,
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              size: 18,
            )),
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
                      });
                    },
                    selectedColor: ColorConstant.primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Name'),
                    TextFormField(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Language'),
                    TextFormField(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Location'),
                    TextFormField(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Contact No.'),
                    TextFormField(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Email Id'),
                    TextFormField(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Gender'),
                    TextFormField(),
                    const SizedBox(
                      height: 10,
                    ),
                    if (user == "service_provider") ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Skills'),
                          TextFormField(),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ],
                    if (user == "service_provider") ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Expected Pay'),
                          TextFormField(),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ],
                    const Text('Description'),
                    TextFormField(),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
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
