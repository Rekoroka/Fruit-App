import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(color: Colors.grey.shade200, height: 1.0.h),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),

                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 110.w,
                        height: 110.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF2D5E3D),
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          Icons.person_outline,
                          size: 60.sp,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          size: 20.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),
                Text(
                  'Welcome, Ahmed',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30.h),

                _buildTextField(
                  label: 'Full name',
                  hint: 'First and Last Name',
                ),
                SizedBox(height: 20.h),
                _buildPhoneField(),
                SizedBox(height: 20.h),
                _buildTextField(
                  label: 'Password',
                  hint: 'Password',
                  isPassword: true,
                ),

                SizedBox(height: 120.h),
              ],
            ),
          ),

          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: CustomButton(text: 'Update', onTap: () {}),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label *',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 8.h),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 15.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.r),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number with Whatsapp *',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5.w),
                    Text('KW', style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
              ),
              Container(width: 1, height: 30.h, color: Colors.grey.shade200),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
