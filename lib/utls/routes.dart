import 'package:get/get.dart';
import 'package:ruralclap_app/pages/create_job_page.dart';

class RoutesClass {
  // static String nav = '/nav';
  static String createJobPageRoute = '/create-job-page';

  static List<GetPage> routes = [
    // GetPage(name: nav, page: () => LayoutPage()),
    GetPage(name: createJobPageRoute, page: () => const CreateJobPage()),
  ];
}
