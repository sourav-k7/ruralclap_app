import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRoutes {
  static String url = 'http://${dotenv.env['IP']!}:8000';

  //Login api
  static String loginApi = '$url/authentication/rest-auth/google/';
  static String createUserApi = '$url/users/create/';
  static String createJobApi = '$url/jobs/create/';
}
