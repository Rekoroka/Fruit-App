import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/widgets/bottom_navigator_bar.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  int quantity = 1;

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
          'Basket',
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
      body: Column(
        children: [
          // 1. قائمة منتجات السلة
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: 3,
              itemBuilder: (context, index) => _buildBasketItem(),
            ),
          ),

          // 2. ملخص الحساب والزر السفلي
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dashedLine(),
                SizedBox(height: 15.h),
                _summaryRow("Subtotal", "36.00 KD"),
                _summaryRow("Shipping Charges", "1.50 KD"),
                _summaryRow("Bag Total", "37.50 KD", isTotal: true),
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "4 items in cart",
                          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                        ),
                        Text(
                          "37.50 KD",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // --- زر الـ Checkout المعدل باستخدام CustomNavItem ---
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D5E3D),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: CustomNavItem(
                        icon: Icons.check_circle_outline,
                        label: "Proceed To Checkout",
                        isSelected:
                            false, // نتركه false ليظهر النص الأبيض والخلفية الخضراء
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildMainBottomNavBar(),
    );
  }

  Widget _buildBasketItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // مكان الصورة الدائرية
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35.r),
              child: Image.asset("assets/images/fig2.png", fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 12.w),
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
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.delete_forever,
                      color: Colors.black,
                      size: 22.sp,
                    ),
                  ],
                ),
                Text(
                  "12.00 KD",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          // متحكم الكمية
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                _quantityBtn(Icons.remove, () {}),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _quantityBtn(Icons.add, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 18.sp, color: Colors.grey),
    );
  }

  Widget _summaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15.sp,
              color: isTotal ? const Color(0xFF2D5E3D) : Colors.grey,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashedLine() {
    return Row(
      children: List.generate(
        40,
        (index) => Expanded(
          child: Container(
            color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade300,
            height: 1,
          ),
        ),
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
            icon: Icons.home,
            label: "Home",
            isSelected: false,
            onTap: () {},
          ),
          CustomNavItem(
            icon: Icons.list,
            label: "Orders",
            isSelected: false,
            onTap: () {},
          ),
          CustomNavItem(
            icon: Icons.shopping_basket,
            label: "Basket",
            isSelected: true,
            onTap: () {},
          ),
          CustomNavItem(
            icon: Icons.favorite,
            label: "Fav",
            isSelected: false,
            onTap: () {},
          ),
          CustomNavItem(
            icon: Icons.more_horiz,
            label: "More",
            isSelected: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
