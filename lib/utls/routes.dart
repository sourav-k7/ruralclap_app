import 'package:get/get.dart';
import 'package:ruralclap_app/pages/create_job_page.dart';
import 'package:ruralclap_app/pages/job_application_page.dart';
import 'package:ruralclap_app/pages/job_listing_page.dart';
import 'package:ruralclap_app/pages/layout.dart';
import 'package:ruralclap_app/pages/login_page.dart';
import 'package:ruralclap_app/pages/onboarding_page.dart';
import 'package:ruralclap_app/pages/service_provider_list_page.dart';

class RoutesClass {
  // static String nav = '/nav';
  static String createJobPageRoute = '/create-job-page';
  static String loginPageRoute = '/login';
  static String layoutPageRoute = '/layout';
  static String onboardingPage = '/onboarding';
  static String jobListingPageRoute = '/job-listing-page';
  static String jobInformationPageRoute = '/job-info-page';
  static String serviceProviderListingPageRoute = '/service-provider-listing';

  static List<GetPage> routes = [
    // GetPage(name: nav, page: () => LayoutPage()),
    GetPage(name: createJobPageRoute, page: () => const CreateJobPage()),
    GetPage(name: loginPageRoute, page: () => const LoginPage()),
    GetPage(name: layoutPageRoute, page: () => const BottomNav()),
    GetPage(name: onboardingPage, page: () => const OnboardingPage()),
    GetPage(name: jobListingPageRoute, page: () => JobListing()),
    GetPage(name: jobInformationPageRoute, page: () => JobDetailPage()),
    GetPage(
        name: serviceProviderListingPageRoute,
        page: () => ServiceProviderListPage()),
  ];
}
