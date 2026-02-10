import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/widgets/bottom_navigator_bar.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        centerTitle: true,
        title: Text(
          'My Orders',
          style: TextStyle(
            color: const Color(0xFF204F38),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
              children: [
                _buildOrderItem(
                  id: "#243188 - 37 KD",
                  date: "9 Sep",
                  items: "4 items",
                  status: "Delivering",
                  color: const Color(0xFFFFC107),
                  svgPath: 'assets/icons/delivering.svg',
                ),
                SizedBox(height: 15.h),
                _buildOrderItem(
                  id: "#882610",
                  date: "8 Sep",
                  items: "3 items",
                  status: "Finished",
                  color: const Color(0xFF00C853),
                  svgPath: 'assets/icons/finished.svg',
                ),
                SizedBox(height: 15.h),
                _buildOrderItem(
                  id: "#882610",
                  date: "8 Sep",
                  items: "3 items",
                  status: "Canceled",
                  color: const Color(0xFFFF5252),
                  svgPath: 'assets/icons/canceled.svg',
                ),
                SizedBox(height: 15.h),
                _buildOrderItem(
                  id: "#882610",
                  date: "8 Sep",
                  items: "3 items",
                  status: "Working",
                  color: const Color(0xFF3F51B5),
                  svgPath: 'assets/icons/working.svg',
                ),
                SizedBox(height: 15.h),
                _buildOrderItem(
                  id: "#882610",
                  date: "8 Sep",
                  items: "3 items",
                  status: "Delivered",
                  color: const Color(0xFFE040FB),
                  svgPath: 'assets/icons/delivered.svg',
                ),
                SizedBox(height: 15.h),
                _buildOrderItem(
                  id: "#882610",
                  date: "8 Sep",
                  items: "3 items",
                  status: "New",
                  color: const Color(0xFF03A9F4),
                  svgPath: 'assets/icons/new.svg',
                ),
              ],
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String id,
    required String date,
    required String items,
    required String status,
    required Color color,
    required String svgPath,
  }) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 58.w,
            height: 58.h,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              svgPath,
              width: 28.w,
              height: 22.h,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "$date  •  $items",
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      "Status : ",
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: 66.w,
            height: 66.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Container(
              width: 25.w,
              height: 23.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.2),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: SvgPicture.asset(
                'assets/icons/arrow_right.svg',
                width: 9.w,
                height: 12.h,
                fit: BoxFit.contain,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
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
            onTap: () {
              setState(() => currentIndex = 0);
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon2.svg',
            label: "Orders",
            isSelected: currentIndex == 1,
            onTap: () {
              setState(() => currentIndex = 1);
              Navigator.pushReplacementNamed(context, '/my_orders');
            },
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon3.svg',
            label: "Basket",
            isSelected: currentIndex == 2,
            onTap: () {
              setState(() => currentIndex = 2);
              Navigator.pushReplacementNamed(context, '/basket');
            },
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon4.svg',
            label: "Fav",
            isSelected: currentIndex == 3,
            onTap: () {
              setState(() => currentIndex = 3);
              Navigator.pushReplacementNamed(context, '/favorite');
            },
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon5.svg',
            label: "Profile",
            isSelected: currentIndex == 4,
            onTap: () {
              setState(() => currentIndex = 4);
              Navigator.pushReplacementNamed(context, '/more');
            },
          ),
        ],
      ),
    );
  }
}
