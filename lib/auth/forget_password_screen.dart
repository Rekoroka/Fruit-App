import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/custom_social_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  'Fruit Market',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D5E3D),
                  ),
                ),
              ),

              SizedBox(height: 30.h),
              Center(
                child: Text(
                  'Enter Your Number',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              const LabelText(text: 'Phone Number with Whatsapp'),
              const PhoneInputFiled(),

              SizedBox(height: 40.h),
              CustomSocialButton(
                text: 'Submit',
                color: const Color(0xFF204F38),
                textColor: Colors.white,
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/otp');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneInputFiled extends StatelessWidget {
  const PhoneInputFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                const Icon(Icons.keyboard_arrow_down),
                SizedBox(width: 4.w),
                Text('KW', style: TextStyle(fontSize: 14.sp)),
              ],
            ),
          ),
          Container(width: 1, height: 30.h, color: Colors.grey.shade300),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  final String text;
  const LabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, left: 4.w),
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(color: Colors.grey[700], fontSize: 14.sp),
          children: const [
            TextSpan(
              text: ' *',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
