import 'package:flutter/material.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/pages/applied_job_page.dart';
import 'package:ruralclap_app/pages/create_job_page.dart';
import 'package:ruralclap_app/pages/service_provider_profile_page.dart';
import 'package:ruralclap_app/pages/service_provider_list_page.dart';
import 'package:ruralclap_app/pages/service_request_page.dart';
import 'package:ruralclap_app/pages/job_listing_page.dart';
import 'package:ruralclap_app/pages/job_application_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruralclap',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: const MaterialColor(0xFF0066ff, <int, Color>{
          50: Color(0xFF5C9DFF),
          100: Color(0xFF4791FF),
          200: Color(0xFF3385FF),
          300: Color(0xFF1F78FF),
          400: Color(0xFF0066ff),
          500: Color(0XFF0062F5),
          600: Color(0xFF005AE0),
          700: Color(0xFF0052CC),
          800: Color(0xFF0049B8),
          900: Color(0xFF0041A3),
        }),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0066ff),
          primary: const Color(0xFF0066ff),
          secondary: const Color(0XFFFA8334),
          secondaryContainer: const Color(0xFFECF8FD),
          surface: const Color(0xFFECF8FD),
          onSecondaryContainer: const Color(0XFFFA8334),
          onSurface: const Color(0XFFFA8334),
          outline: const Color(0XFFFA8334),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: ColorConstant.textPrimaryBlack,
              displayColor: ColorConstant.textBody,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rural Clap"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateJobPage()),
                );
              },
              child: const Text('Create Job page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ServiceRequest()),
                );
              },
              child: const Text('Job Request'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ServiceProviderListPage()),
                );
              },
              child: const Text('Hire service provider page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobListing()),
                );
              },
              child: const Text('Job Listing page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobApplication()),
                );
              },
              child: const Text('Job Application page'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SPProfilePage()),
                  );
                },
                child: const Text('Service Provider page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppliedJobs()),
                  );
                },
                child: const Text('Applied Jobs page'))
          ],
        ),
      ),
    );
  }
}
