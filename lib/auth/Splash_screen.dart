import 'package:flutter/material.dart';
import 'package:fruit_app/Onboarding/onboarding_view.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingView()),
      ),
    );
  }

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
