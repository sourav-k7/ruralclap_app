import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:ruralclap_app/utls/routes.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});
  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorConstant.primaryColor),
              ),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });
                await _userController.login();
                setState(() {
                  _isSigningIn = false;
                });
                if (_userController.user.location == null) {
                  Get.offAndToNamed(RoutesClass.onboardingPage);
                } else if (_userController.user.location != null) {
                  if (_userController.user.isEmployer == false) {
                    Get.offAndToNamed(RoutesClass.layoutPageRoute);
                  } else if (_userController.user.isEmployer == true) {
                    Get.offAndToNamed(RoutesClass.jobListingPageRoute);
                  }
                }
              },
              child: Material(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage(
                          "assets/images/google_logo.png",
                        ),
                        height: 24.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
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
