import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        "name": "Strawberry",
        "price": "12.00 KD",
        "img": "assets/images/fig2.png",
        "disc": "Up to 10% Off",
      },
      {
        "name": "Apple",
        "price": "5.00 KD",
        "img": "assets/images/fig2.png",
        "disc": "Free Delivery",
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return ProductCard(
          name: products[index]["name"]!,
          price: products[index]["price"]!,
          imagePath: products[index]["img"]!,
          discount: products[index]["disc"]!,
          onAdd: () {
            print("Added ${products[index]["name"]} to cart");
          },
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final String discount;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.discount,
    required this.onAdd,
  });

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
          SizedBox(
            width: 87.w,
            height: 87.h,
            child: Center(
              child: Image.asset(
                imagePath,
                width: 70.w,
                height: 70.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEAEA),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    discount,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onAdd,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                color: Color(0xFF2D5E3D),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
