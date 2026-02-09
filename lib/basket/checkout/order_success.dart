import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/custom_social_button.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

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
                'assets/images/order_success.png',
                height: 200.h,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 30.h),

              Text(
                'YOUR ORDER IS CONFIRMED!',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF204F38),
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                'Your order code: #243188\nThank you for choosing our products!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              ),

              SizedBox(height: 40.h),

              CustomSocialButton(
                text: 'Continue Shopping',
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/my_orders');
                },
                color: const Color(0xFF204F38),
                textColor: Colors.white,
              ),

              SizedBox(height: 15.h),

              CustomSocialButton(
                text: 'Track Order',
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/order_tracking');
                },
                color: Colors.white,
                textColor: const Color(0xFF204F38),
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
