import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/product_list.dart';

class SellerDetails extends StatefulWidget {
  const SellerDetails({super.key});

  @override
  State<SellerDetails> createState() => _SellerDetailsState();
}

class _SellerDetailsState extends State<SellerDetails> {
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSellerHeader(),
            const SectionTitle(title: 'Categories'),
            const CategoriesList(),

            const SectionTitle(title: 'Products'),
            const ProductsList(),

            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSellerHeader() {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35.r,
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Delivery : 40 to 60 Min',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Open',
                      style: TextStyle(color: Colors.green, fontSize: 12.sp),
                    ),
                    SizedBox(width: 10.w),
                    const CircleAvatar(radius: 3, backgroundColor: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      '4.5',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.stars, color: Colors.red.shade300, size: 24.sp),
        ],
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
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          if (title == "Products")
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/fruit_shop');
              },
              child: Icon(Icons.sort, color: Colors.black, size: 20.sp),
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
    List<String> catNames = ["Fruits", "Vegetables", "Phone", "Pets"];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return Column(
            children: [
              Container(
                width: 78.w,
                height: 78.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/fig${index + 1}.png",
                    width: 55.w,
                    height: 50.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                catNames[index],
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
            ],
          );
        }),
      ),
    );
  }
}
