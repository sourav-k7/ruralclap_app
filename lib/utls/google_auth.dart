import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';

class GoogleAuth {
  static Future<String?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: dotenv.env['GOOGLE_CLIENT_ID'],
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

  static Future<void> signOutGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final UserController _userController = Get.find<UserController>();
    try {
      await googleSignIn.signOut();
      _userController.clearUserData();
      print(_userController.user.email);
      print("User signed out of Google account");
    } catch (error) {
      print("Error signing out of Google account: $error");
    }
  }
}
