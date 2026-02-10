import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/custom_social_button.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Text(
                'Fruit Market',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D5E3D),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Enter Received OTP',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40.h),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OTPDotInput(),
                  OTPDotInput(),
                  OTPDotInput(),
                  OTPDotInput(),
                ],
              ),

              SizedBox(height: 50.h),
              CustomSocialButton(
                text: 'Confirm',
                color: const Color(0xFF204F38),
                textColor: Colors.white,
                onTap: () {},
              ),

              SizedBox(height: 40.h),
              Text(
                '60',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not received? ',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Send Again',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF005B96),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPDotInput extends StatelessWidget {
  const OTPDotInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 40.w,
      child: TextFormField(
        autofocus: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Color(0xFF2D5E3D)),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
