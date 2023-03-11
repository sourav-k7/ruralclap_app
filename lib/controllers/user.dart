import 'package:get/get.dart';
import 'package:ruralclap_app/models/user.dart';
import 'package:ruralclap_app/services/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ruralclap_app/services/user_service.dart';
import '../widgets/errorSnackBar.dart';
import '../utls/google_auth.dart';

class UserController extends GetxController {
  final storage = const FlutterSecureStorage();
  final Rx<User> _user = User().obs;
  User get user => _user.value;
  Future<void> login() async {
    String? accessToken = await GoogleAuth.signInWithGoogle();
    if (accessToken != null) {
      storage.write(key: 'accessToken', value: accessToken);
      var res = await AuthServices.verifyTokenService(accessToken: accessToken);
      if (!res['isNewUser']) {
        _user.value = User.fromJson(res["userData"]);
      } else if (res['isNewUser']) {
        _user.value = User.fromJson(res['info']);
      }
    } else {
      errorSnackBar(content: 'Some error occured');
    }
  }

  Future<void> createUser({required User userData}) async {
    final storage = const FlutterSecureStorage();
    var accessToken = await storage.read(key: 'accessToken');
    if (accessToken != null) {
      var res = await UserServices.createUserService(
          accessToken: accessToken as String, userData: userData);
      if (res != 'Error400') {
        print("from user controller this is res");
        print(res.toString());
        _user.value = User.fromJson(res);
      }
    }
  }
}
