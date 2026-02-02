import 'package:flutter/material.dart';

//import 'dart:async';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   // Set a timer to navigate to the home screen after a duration
  //   Timer(
  //     const Duration(seconds: 3),
  //     () => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_) => const HomeScreen()),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 430 / 932,
          child: Image.asset(
            'assets/images/splash.png',
            width: screenSize.width,
            height: screenSize.height,
          ),
        ),
      ),
    );
  }
}
