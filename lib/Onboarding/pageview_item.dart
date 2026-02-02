import 'package:flutter/material.dart';
import 'model';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageItem extends StatelessWidget {
  final onboardingModel model;
  const OnboardingPageItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 170.h),
          SizedBox(
            height: 273.32.h,
            width: 285.11.w,
            child: Image.asset(model.image, fit: BoxFit.contain),
          ),
          SizedBox(height: 50.h),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 50.h),
          Text(
            model.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: const Color.fromARGB(255, 117, 117, 117),
            ),
          ),
        ],
      ),
    );
  }
}
