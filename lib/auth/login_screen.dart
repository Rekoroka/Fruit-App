import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/custom_social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
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
                  'Login to Wikala',
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

              SizedBox(height: 30.h),
              const LabelText(text: 'Password'),
              const CustomTextField(hint: 'Password', isPassword: true),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF005B96),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              CustomSocialButton(
                text: 'Login',
                color: const Color(0xFF204F38),
                textColor: Colors.white,
                onTap: () {},
              ),

              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/signup'),
                    child: Text(
                      'Sign Up',
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
              SizedBox(height: 20.h),
            ],
          ),
        ),
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

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
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
