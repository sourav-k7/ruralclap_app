import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/job.dart';
import 'package:ruralclap_app/utls/routes.dart';
import 'package:ruralclap_app/widgets/AppliedJobCard.dart';
import 'package:ruralclap_app/constant/classes.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobs();
}

class _AppliedJobs extends State<AppliedJobs> {
  final UserController _userController = Get.find<UserController>();
  final JobController _jobController = JobController();
  List<Job> Jobs = [
    Job(
        postName: "iOS Team Lead",
        applicationStatus: "Selected",
        createdDate: DateTime(2023, 5, 14),
        numberOfApplicants: 448),
  ];

  @override
  void initState() {
    super.initState();

    if (_userController.user.email != null) {
      int? employerId = _userController.user.id;
      _jobController.listEmployerJobs(employerId: employerId);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _getFAB() {
      if (_userController.user.isEmployer!) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 5, 20),
          child: SizedBox(
            width: 65,
            height: 65,
            child: FloatingActionButton(
              mini: false,
              onPressed: () {
                Get.toNamed(RoutesClass.createJobPageRoute);
              },
              backgroundColor: ColorConstant.primaryColor,
              child: const FaIcon(
                FontAwesomeIcons.plus,
                size: 30,
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _userController.user.isEmployer!
              ? 'Jobs You Created in the Past'
              : 'My Applied Jobs',
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: ColorConstant.textPrimaryBlack,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        backgroundColor: ColorConstant.lightBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            color: ColorConstant.lightBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: Jobs.map((job) => AppliedJobCard(
                    job: job,
                  )).toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: _getFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

// class AppliedJobs extends StatefulWidget {
//   const AppliedJobs({super.key});

//   @override
//   State<AppliedJobs> createState() => _AppliedJobs();
// }

// class _AppliedJobs extends State<AppliedJobs> {
//   final UserController _userController = Get.find<UserController>();
//   final JobController _jobController = JobController();

// List<dynamic> _jobs = [];

// @override
// void initState() {
//   super.initState();
//   final user = _userController.user;
//   print("user id is ============= ");
//   print(user.id);
//   final userId = user.id;
//   grabber(userId!);
// }

// Future grabber(int userId) async {
//   final url =
//       'http://192.168.43.126:8000/users/service-provider/$userId/applied-jobs/';


//   final response = await http.get(Uri.parse(url));
//   final responseData = response.body;
//   final List<dynamic> jobData = json.decode(responseData);
//   List<Job> _jobs = [];

//   for (var jobJson in jobData) {
//     Job job = Job(
//       title: jobJson['title'],
//       status: jobJson['status'],
//       createdDate: DateTime.parse(jobJson['created_date']),
//       applicants: jobJson['applicants'],
//     );

//     _jobs.add(job);
//   }

//   setState(() {
//     Jobs = _jobs;
//   });

// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Applied Jobs'),
//       ),
//       body: _jobs.isNotEmpty
//           ? ListView.builder(
//               itemCount: _jobs.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final job = _jobs[index];

//                 return Card(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Job ID: ${job['id']}',
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Employer Name: ${job['employer']['name']}',
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Job Title: ${job['title']}',
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Job Description: ${job['description']}',
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Job Pay: ${job['pay']}',
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Job Status: ${job['status']}',
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             )
//           : const Center(child: CircularProgressIndicator()),
//     );
//   }
// }
