import 'dart:convert';

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
  RxList<User> recoServiceProvider = <User>[].obs;

  Future<String> getAccessToken() async {
    const storage = FlutterSecureStorage();
    var accessToken = await storage.read(key: 'accessToken');
    return accessToken ?? '';
  }

  Future<void> login() async {
    String? accessToken = await GoogleAuth.signInWithGoogle();
    // String? accessToken = "##neymarsk01@gmail.com";
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

  clearUserData() {
    _user.value.id = null;
    _user.value.name = null;
    _user.value.description = null;
    _user.value.skills = null;
    _user.value.email = null;
    _user.value.phone = null;
    _user.value.rating = null;
    _user.value.location = null;
    _user.value.age = null;
    _user.value.language = null;
    _user.value.gender = null;
    _user.value.expectedPayment = null;
    _user.value.isEmployer = null;
  }

  Future<void> createUser({required User userData}) async {
    const storage = FlutterSecureStorage();
    var accessToken = await storage.read(key: 'accessToken');
    if (accessToken != null) {
      var res = await UserServices.createUserService(
          accessToken: accessToken, userData: userData);
      if (res != 'Error400') {
        _user.value = User.fromJson(res);
      }
    }
  }

  Future<void> getServiceProviderReco(
      {required String language,
      required String location,
      required String category}) async {
    try {
      var res = await UserServices.getServiceProviderReco(
          language: language, location: location, category: category);
      res['data'] = jsonDecode(res['data']);
      List<User> recoList = [];
      res['data'].forEach((provider) {
        User newUser = User.fromJson(provider['fields']);
        newUser.id = provider['pk'];
        recoList.add(newUser);
      });
      recoServiceProvider.value = recoList;
      recoServiceProvider.refresh();
    } catch (e) {
      print(e);
      print('some error in service provider reco');
    }
  }
}
