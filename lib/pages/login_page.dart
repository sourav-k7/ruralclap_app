import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ruralclap_app/utls/authentication.dart';
import 'package:ruralclap_app/widgets/google_login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Login'),
        FutureBuilder(
          future: Authentication.initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Error initializing Firebase');
            } else if (snapshot.connectionState == ConnectionState.done) {
              return const GoogleSignInButton();
            }
            return const CircularProgressIndicator();
          },
        ),
      ]),
    );
  }
}
