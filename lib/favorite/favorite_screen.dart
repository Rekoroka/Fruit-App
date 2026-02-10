import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/bottom_navigator_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        centerTitle: true,
        title: Text(
          'Favorite',
          style: TextStyle(
            color: const Color(0xFF204F38),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(height: 1.h, color: Colors.grey.shade300),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20.w),
              itemCount: 2,
              itemBuilder: (context, index) {
                return _buildFavoriteItem();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildMainBottomNavBar(),
    );
  }

  Widget _buildFavoriteItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/images/fig2.png', fit: BoxFit.contain),
          ),
          SizedBox(width: 15.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product name",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF204F38),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(
                      "12.00 KD",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "14.00 KD",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade400,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  "Store Name : Store 1",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainBottomNavBar() {
    return Container(
      height: 70.h,
      margin: EdgeInsets.all(15.w),
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
            isSelected: false,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon2.svg',
            label: "Orders",
            isSelected: false,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/my_orders');
            },
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon3.svg',
            label: "Basket",
            isSelected: false,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/basket');
            },
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon4.svg',
            label: "Fav",
            isSelected: true,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/favorite');
            },
          ),
          CustomNavItem(
            icon: 'assets/icons/bar_icon5.svg',
            label: "More",
            isSelected: false,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/more');
            },
          ),
        ],
      ),
    );
  }
}
