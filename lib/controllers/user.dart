import 'package:get/get.dart';
import 'package:ruralclap_app/models/user.dart';
import 'package:ruralclap_app/services/auth_service.dart';
import '../utls/googleAuth.dart';
import '../widgets/errorSnackBar.dart';

class UserController extends GetxController {
  final Rx<User> _user = User().obs;
  User get user => _user.value;
  Future<void> login() async {
    String? accessToken = await GoogleAuth.signInWithGoogle();
    if (accessToken != null) {
      var res = await AuthServices.verifyTokenService(accessToken: accessToken);
      if (!res['isNewUser']) {
        _user.value = User.fromJson(res.userData);
      }
    } else {
      errorSnackBar(content: 'Some error occured');
    }
  }
}
