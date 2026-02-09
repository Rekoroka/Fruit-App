import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/widgets/filter_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Fruit Market',
          style: TextStyle(
            color: const Color(0xFF2D5E3D),
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const FilterDialog(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerWidget(),
            const SectionTitle(title: 'Categories'),
            const CategoriesList(),
            const SectionTitle(title: 'Sellers'),
            const SellersList(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
      bottomNavigationBar: _buildCustomBottomBar(),
    );
  }

  Widget _buildCustomBottomBar() {
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
          _navItem(0, "assets/icons/bar_icon1.svg", "Home"),
          _navItem(1, "assets/icons/bar_icon2.svg", "Orders"),
          _navItem(2, "assets/icons/bar_icon3.svg", "Basket"),
          _navItem(3, "assets/icons/bar_icon4.svg", "Favorite"),
          _navItem(4, "assets/icons/bar_icon5.svg", "More"),
        ],
      ),
    );
  }

  Widget _navItem(int index, String svgPath, String label) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                isSelected ? const Color(0xFF2D5E3D) : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            if (isSelected) ...[
              SizedBox(width: 4.w),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF2D5E3D),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: const DecorationImage(
          image: AssetImage("assets/images/home1.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          if (title == "Sellers")
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/saller_details');
              },
              child: const Text(
                "Show all",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
        ],
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return Container(
            width: 78.w,
            height: 78.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                "assets/images/frame${index + 1}.png",
                width: 55.w,
                height: 50.h,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class SellersList extends StatelessWidget {
  const SellersList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => const SellerCard(),
    );
  }
}

class SellerCard extends StatelessWidget {
  const SellerCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.grey.shade100,
            backgroundImage: const AssetImage("assets/images/home_logo.png"),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seller name',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Delivery Charges : 0.5 KD',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Open',
                      style: TextStyle(fontSize: 11.sp, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('4.5 ', style: TextStyle(fontSize: 12.sp)),
                  Icon(Icons.star, color: Colors.amber, size: 14.sp),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                '2.5 KM',
                style: TextStyle(fontSize: 11.sp, color: Colors.teal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
