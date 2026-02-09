import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/custom_social_button.dart';

class OrderErrorScreen extends StatelessWidget {
  const OrderErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/order_failed.png',
                height: 180.h,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 30.h),

              Text(
                'OPS',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFF5252),
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                'Error while confirming your payment/order',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
              ),

              SizedBox(height: 50.h),

              CustomSocialButton(
                text: 'Back',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/payment'),
                color: const Color(0xFFFF5252),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        onPressed: () => Navigator.pushReplacementNamed(context, '/basket'),
      ),
      title: Text(
        'Checkout',
        style: TextStyle(
          color: const Color(0xFF204F38),
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
      centerTitle: true,
    );
  }
}
