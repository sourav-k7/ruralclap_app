import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:ruralclap_app/utls/routes.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});
  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;
  final UserController _userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return _isSigningIn
        ? const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
        : OutlinedButton(
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
                Get.offAndToNamed(RoutesClass.layoutPageRoute);
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
          );
  }
}
