import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRoutes {
  static String url = 'http://${dotenv.env['IP']!}:8000';

  //Login api
  static String loginApi = '$url/authentication/rest-auth/google/';
  static String createUserApi = '$url/users/create/';

  //Job api
  static String createJobApi = '$url/jobs/create/';
  static String listEmployerJobsApi = '$url/jobs/list-employer/';
  static String getJob = '$url/jobs/list';

  //Job application
  static String applyJob = '$url/job-application/create/';
  static String jobApplicantList = '$url/job-application/list/';

  //Service provider api
  static String serviceProviderReco = '$url/users/service-provider/reco/';
}
