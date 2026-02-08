import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FruitShop extends StatefulWidget {
  const FruitShop({super.key});

  @override
  State<FruitShop> createState() => _FruitShopState();
}

class _FruitShopState extends State<FruitShop> {
  // متغيرات الحالة لإدارة الاختيارات
  String selectedWeight = "2 Kg - 12.00 KD";
  String selectedAddon = "";

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
          'Product Name',
          style: TextStyle(
            color: const Color(0xFF2D5E3D),
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.ios_share, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(color: Colors.grey.shade200, height: 1.0.h),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. الصورة الرئيسية مع تاج الخصم
                _buildProductImage(),

                SizedBox(height: 15.h),

                // 2. تفاصيل المنتج والأسعار
                _buildProductInfo(),

                SizedBox(height: 20.h),

                // 3. قسم اختيار الوزن (مفتوح افتراضياً)
                _buildWeightSelection(),

                const Divider(thickness: 1, color: Color(0xFFEEEEEE)),

                // 4. قسم الإضافات
                _buildAddonsSelection(),

                SizedBox(height: 100.h), // مسافة للزر السفلي
              ],
            ),
          ),

          // 5. زر الإضافة للسلة (Floating)
          _buildAddToCartButton(),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Stack(
      children: [
        Container(
          height: 250.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
              image: AssetImage(
                "assets/images/product_bg.png",
              ), // حساب مكان الصورة
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 15.h,
          right: 15.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Text(
              "10% Off Discount",
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category Name",
          style: TextStyle(
            color: const Color(0xFF2D5E3D),
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Product name",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Price",
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
                Row(
                  children: [
                    Text(
                      "KD12.00",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "KD14.00",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.red.withOpacity(0.5),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
        ),
        SizedBox(height: 10.h),
        Text(
          "Sell Per : Kartoon",
          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
        ),
      ],
    );
  }

  Widget _buildWeightSelection() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          "Select weight",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(Icons.keyboard_arrow_up, color: Colors.grey),
        children: [
          _buildRadioOption(
            "50 Gram - 4.00 KD",
            selectedWeight,
            (v) => setState(() => selectedWeight = v!),
          ),
          _buildRadioOption(
            "1 Kg - 6.25 KD",
            selectedWeight,
            (v) => setState(() => selectedWeight = v!),
          ),
          _buildRadioOption(
            "2 Kg - 12.00 KD",
            selectedWeight,
            (v) => setState(() => selectedWeight = v!),
          ),
        ],
      ),
    );
  }

  Widget _buildAddonsSelection() {
    return ExpansionTile(
      title: Text(
        "Select Addons",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
      children: [
        _buildRadioOption(
          "50 Gram - 4.00 KD",
          selectedAddon,
          (v) => setState(() => selectedAddon = v!),
        ),
        _buildRadioOption(
          "1 Kg - 6.25 KD",
          selectedAddon,
          (v) => setState(() => selectedAddon = v!),
        ),
      ],
    );
  }

  Widget _buildRadioOption(
    String title,
    String groupValue,
    ValueChanged<String?> onChanged,
  ) {
    return RadioListTile<String>(
      value: title,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: const Color(0xFF2D5E3D),
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Widget _buildAddToCartButton() {
    return Positioned(
      bottom: 30.h,
      right: 20.w,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.shopping_basket_outlined, color: Colors.white),
        label: const Text(
          "Add to Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2D5E3D),
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
    );
  }
}
