import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  static Future<String?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '422436897824-dmi072rgnmpa4lv338nekpjhoblfqh10.apps.googleusercontent.com',
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
    return null;
  }

  //todo: logout function
}
