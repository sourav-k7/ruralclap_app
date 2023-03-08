import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});
  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;
  // ignore: body_might_complete_normally_nullable
  static Future<String?> signInWithGoogle() async {
    //CHANGE CLIENT ID WITH RESPECT TO YOUR OWN CLIENT ID!!!!!!!
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '422436897824-jkjfr2tj51118i0d0h6fq7ucnutkfgtq.apps.googleusercontent.com',
      serverClientId:
          '422436897824-v7gfeacadmg099objpl7269e3kmflsf0.apps.googleusercontent.com',
    );

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      return googleSignInAuthentication.idToken;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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

                final String? accessToken = await signInWithGoogle();

                try {
                  // var token = await user.getIdToken();
                  var res = await http.post(
                      Uri.parse(
                          'http://192.168.137.1:8000/authentication/rest-auth/google/'),
                      headers: {'Authorization': 'Bearer $accessToken'});
                  print(res.body);
                } catch (e) {
                  print(e);
                }

                setState(() {
                  _isSigningIn = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
