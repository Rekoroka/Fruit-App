import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/custom_social_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            children: [
              SizedBox(height: 80.h),
              Text(
                'Fruit Market',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF204F38),
                ),
              ),
              SizedBox(height: 50.h),
              Text(
                'Welcome to Our app',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 50.h),
              CustomSocialButton(
                icon: 'assets/icons/phone.png',
                text: 'Sign in with phone number',
                onTap: () {},
              ),
              SizedBox(height: 35.h),
              CustomSocialButton(
                icon: 'assets/icons/google.png',
                text: 'Sign in with Google',
                onTap: () {},
              ),
              SizedBox(height: 35.h),
              CustomSocialButton(
                icon: 'assets/icons/facebook.png',
                text: 'Sign in with Facebook',
                color: const Color(0xFF4267B2),
                textColor: Colors.white,
                onTap: () {},
              ),
              SizedBox(height: 70.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already member? ', style: TextStyle(fontSize: 14.sp)),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF005B96),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70.h),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text: 'By continue you agree to our ',
                      style: TextStyle(color: Color(0xFF88909C)),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Terms of service',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xFF005B96),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const TextSpan(
                      text: ' and our ',
                      style: TextStyle(color: Color(0xFF88909C)),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xFF005B96),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
