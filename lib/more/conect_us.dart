import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: TextStyle(
            color: const Color(0xFF2D5E3D),
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(color: Colors.grey.shade200, height: 1.0.h),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),

            _buildLabel('Name'),
            _buildTextField(hint: ''),

            SizedBox(height: 20.h),
            _buildLabel('Mobile Number'),
            _buildTextField(hint: '', keyboardType: TextInputType.phone),

            SizedBox(height: 20.h),
            _buildLabel('Message'),
            _buildTextField(hint: '', maxLines: 5),

            SizedBox(height: 40.h),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2D5E3D),
                minimumSize: Size(double.infinity, 55.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 30.h),

            // صف أيقونات التواصل الاجتماعي
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialContainer("assets/icons/whatsapp.svg"),
                SizedBox(width: 15.w),
                _buildSocialContainer("assets/icons/face.svg"),
                SizedBox(width: 15.w),
                _buildSocialContainer("assets/icons/insta.svg"),
                SizedBox(width: 15.w),
                _buildSocialContainer("assets/icons/youtube.svg"),
              ],
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // التعديل هنا: استخدمنا SvgPicture بدل Image
  Widget _buildSocialContainer(String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: SvgPicture.asset(
          assetPath,
          width: 25.w,
          height: 25.h,
          // لو حابة توحدي لون الأيقونات ممكن تضيفي colorFilter
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, left: 10.w),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
