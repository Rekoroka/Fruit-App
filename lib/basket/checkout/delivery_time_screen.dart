import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/bottom_navigator_bar.dart';

class DeliveryTimeScreen extends StatefulWidget {
  const DeliveryTimeScreen({super.key});

  @override
  State<DeliveryTimeScreen> createState() => _DeliveryTimeScreenState();
}

class _DeliveryTimeScreenState extends State<DeliveryTimeScreen> {
  int currentIndex = 2;
  String selectedTimeType = "Now";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, '/basket'),
        ),
        centerTitle: true,
        title: Text(
          'Checkout',
          style: TextStyle(
            color: const Color(0xFF2D5E3D),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(color: Colors.grey.shade100, height: 1.0.h),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            _buildStepperHeader(),
            SizedBox(height: 15.h),
            Container(height: 1.h, color: Colors.grey.shade300),
            SizedBox(height: 35.h),

            _buildSelectionCard(
              "Now",
              selectedTimeType == "Now",
              () => setState(() => selectedTimeType = "Now"),
            ),

            SizedBox(height: 15.h),

            _buildSelectionCard(
              "Select Delivery Time",
              selectedTimeType == "Schedule",
              () => setState(() => selectedTimeType = "Schedule"),
            ),

            if (selectedTimeType == "Schedule") ...[
              SizedBox(height: 20.h),
              _buildDeliveryTimeCard(),
            ],

            SizedBox(height: 40.h),
          ],
        ),
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/delivery_address');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2D5E3D),
                minimumSize: Size(double.infinity, 54.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 100.h),

          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 70.h,
      margin: EdgeInsets.fromLTRB(15.w, 0, 15.w, 20.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2D5E3D),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomNavItem(
            icon: 'assets/icons/bar_icon1.svg',
            label: "Home",
            isSelected: currentIndex == 0,
            onTap: () => setState(() => currentIndex = 0),
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon2.svg',
            label: "Orders",
            isSelected: currentIndex == 1,
            onTap: () => setState(() => currentIndex = 1),
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon3.svg',
            label: "Basket",
            isSelected: currentIndex == 2,
            onTap: () => setState(() => currentIndex = 2),
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon4.svg',
            label: "Fav",
            isSelected: currentIndex == 3,
            onTap: () => setState(() => currentIndex = 3),
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon5.svg',
            label: "Profile",
            isSelected: currentIndex == 4,
            onTap: () => setState(() => currentIndex = 4),
          ),
        ],
      ),
    );
  }

  Widget _buildStepperHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _stepItem(true, "Delivery Time"),
        _stepLine(false),
        _stepItem(false, "Delivery Address"),
        _stepLine(false),
        _stepItem(false, "Payment"),
      ],
    );
  }

  Widget _stepItem(bool isActive, String label) {
    return Column(
      children: [
        Container(height: 1.h, color: Colors.grey.shade300),
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? const Color(0xFF2D5E3D) : Colors.white,
            border: Border.all(
              color: isActive ? const Color(0xFF2D5E3D) : Colors.grey.shade300,
              width: 2,
            ),
          ),
          child: isActive
              ? Icon(Icons.check, color: Colors.white, size: 16.sp)
              : null,
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _stepLine(bool isFinished) {
    return Container(
      width: 45.w,
      height: 2,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      color: isFinished ? const Color(0xFF2D5E3D) : Colors.grey.shade200,
    );
  }

  Widget _buildSelectionCard(
    String title,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF2D5E3D) : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? const Color(0xFF2D5E3D) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryTimeCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Date",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              Icon(
                Icons.calendar_today,
                size: 18.sp,
                color: const Color(0xFF2D5E3D),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            "09 - 15 - 2021",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
