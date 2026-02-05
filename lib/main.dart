import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/home_screen.dart';
//import 'package:fruit_app/otp_view.dart';
//import 'package:fruit_app/login_screen.dart';
//import 'package:fruit_app/verify_number.dart';
//import 'package:fruit_app/signup_screen.dart';
//import 'package:fruit_app/Onboarding/onboarding_view.dart';
//import 'package:fruit_app/welcome_screen.dart';
//import 'package:fruit_app/Splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: child);
      },
      child: const HomeScreen(),
    );
  }
}
