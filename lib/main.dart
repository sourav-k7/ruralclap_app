import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/pages/layout.dart';
import 'package:ruralclap_app/pages/login_page.dart';
import 'package:ruralclap_app/utls/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      getPages: RoutesClass.routes,
      home: const LoginPage(),
    );
  }
}
