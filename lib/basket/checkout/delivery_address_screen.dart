import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/bottom_navigator_bar.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  int _selectedAddressIndex = 0;
  int currentIndex = 3;

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
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          Container(height: 1.h, color: Colors.grey.shade300),
          // Header stepper
          Container(
            padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStepCircle(
                      1,
                      "Delivery Time",
                      isActive: true,
                      isDone: true,
                    ),
                    SizedBox(width: 15.w),
                    _buildStepLine(isActive: true),
                    SizedBox(width: 15.w),
                    _buildStepCircle(
                      2,
                      "Delivery Address",
                      isActive: true,
                      isDone: false,
                    ),
                    SizedBox(width: 15.w),
                    _buildStepLine(isActive: false),
                    SizedBox(width: 15.w),
                    _buildStepCircle(
                      3,
                      "Payment",
                      isActive: false,
                      isDone: false,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(height: 1.h, color: Colors.grey.shade300),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),

                  Text(
                    "Select Delivery Address",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 0,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add_circle_outline,
                            color: Color(0xFF2D5E3D),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Add New Address",
                            style: TextStyle(
                              color: const Color(0xFF2D5E3D),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  _buildAddressCard(
                    isSelected: _selectedAddressIndex == 0,
                    onTap: () => setState(() => _selectedAddressIndex = 0),
                    name: "John Doe",
                    phone: "+000-11-1234567",
                    address:
                        "Room # 1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai - United Arab Emirates",
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ElevatedButton(
              onPressed: () {},
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
            icon: Icons.home,
            label: "Home",
            isSelected: currentIndex == 0,
            onTap: () => setState(() => currentIndex = 0),
          ),
          CustomNavItem(
            icon: Icons.list,
            label: "Orders",
            isSelected: currentIndex == 1,
            onTap: () => setState(() => currentIndex = 1),
          ),
          CustomNavItem(
            icon: Icons.shopping_basket,
            label: "Basket",
            isSelected: currentIndex == 2,
            onTap: () => setState(() => currentIndex = 2),
          ),
          CustomNavItem(
            icon: Icons.favorite,
            label: "Fav",
            isSelected: currentIndex == 3,
            onTap: () => setState(() => currentIndex = 3),
          ),
          CustomNavItem(
            icon: Icons.person,
            label: "Profile",
            isSelected: currentIndex == 4,
            onTap: () => setState(() => currentIndex = 4),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCircle(
    int number,
    String label, {
    required bool isActive,
    required bool isDone,
  }) {
    return Column(
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? const Color(0xFF2D5E3D) : Colors.white,
            border: Border.all(
              color: isActive ? const Color(0xFF2D5E3D) : Colors.grey.shade400,
              width: 2,
            ),
          ),
          child: Center(
            child: isDone
                ? Icon(Icons.check, color: Colors.white, size: 18.sp)
                : Text(
                    "$number",
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey.shade400,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: isActive ? Colors.black : Colors.grey.shade500,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine({required bool isActive}) {
    return Container(
      width: 40.w,
      height: 2.h,
      color: isActive ? const Color(0xFF2D5E3D) : Colors.grey.shade300,
    );
  }

  Widget _buildAddressCard({
    required bool isSelected,
    required VoidCallback onTap,
    required String name,
    required String phone,
    required String address,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF2D5E3D) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF2D5E3D)
                      : Colors.grey.shade400,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF2D5E3D),
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    phone,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
