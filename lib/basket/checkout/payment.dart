import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int currentIndex = 2;
  String _selectedPaymentMethod = "Credit Card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/delivery_address'),
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
          const Divider(height: 1),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: _buildStepperRow(),
          ),
          const Divider(height: 1),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  _buildSectionItem("Delivery Time", Icons.access_time),
                  SizedBox(height: 10.h),
                  _buildSectionItem("Delivery Address", Icons.location_on),
                  SizedBox(height: 10.h),
                  _buildSectionItem("Payment", Icons.payment),

                  SizedBox(height: 20.h),
                  Text(
                    "Coupon Code",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildCouponSection(),

                  SizedBox(height: 25.h),
                  Text(
                    "Order Details",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  _buildOrderDetails(),

                  SizedBox(height: 25.h),
                  Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  _buildPaymentOption(
                    "Credit Card",
                    "assets/icons/credit_card.svg",
                  ),
                  SizedBox(height: 10.h),
                  _buildPaymentOption(
                    "Cash on Delivery",
                    "assets/icons/cash_on_delivery.svg",
                  ),
                  SizedBox(height: 10.h),
                  _buildPaymentOption("Knet", "assets/icons/knet.svg"),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildPlaceOrderSection(), _buildBottomBar()],
        ),
      ),
    );
  }

  Widget _buildSectionItem(String title, IconData icon) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2D5E3D), size: 22.sp),
          SizedBox(width: 15.w),
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey.shade500,
            size: 16.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildCouponSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Do You Have any Coupon Code?",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFF2D5E3D),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              "Apply",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetails() {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _rowDetail("Total Items", "4 Items in cart"),
          SizedBox(height: 10.h),
          _rowDetail("Subtotal", "36.00 KD"),
          SizedBox(height: 10.h),
          _rowDetail("Shipping Charges", "1.50 KD"),
          Divider(height: 25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bag Total",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "37.50 KD",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D5E3D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _rowDetail(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String title, String svgPath) {
    bool isSelected = _selectedPaymentMethod == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = title),
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF2D5E3D) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(svgPath, width: 24.w, height: 24.h),
            SizedBox(width: 15.w),
            Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? const Color(0xFF2D5E3D) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceOrderSection() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/order_success');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2D5E3D),
              minimumSize: Size(double.infinity, 54.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            child: Text(
              "Place Order",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepperRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStep(1, "Delivery Time", true, true),
        _buildLine(true),
        _buildStep(2, "Address", true, true),
        _buildLine(true),
        _buildStep(3, "Payment", true, false),
      ],
    );
  }

  Widget _buildStep(int num, String label, bool active, bool done) {
    return Column(
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? const Color(0xFF2D5E3D) : Colors.white,
            border: Border.all(
              color: active ? const Color(0xFF2D5E3D) : Colors.grey.shade400,
              width: 2,
            ),
          ),
          child: Center(
            child: done
                ? Icon(Icons.check, color: Colors.white, size: 18.sp)
                : Text(
                    "$num",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            color: active ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildLine(bool active) {
    return Container(
      width: 40.w,
      height: 2.h,
      color: active ? const Color(0xFF2D5E3D) : Colors.grey.shade300,
      margin: EdgeInsets.only(bottom: 20.h, left: 5.w, right: 5.w),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 65.h,
      margin: EdgeInsets.fromLTRB(15.w, 0, 15.w, 15.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2D5E3D),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.home, color: Colors.white70),
          const Icon(Icons.list, color: Colors.white70),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_basket,
                  color: const Color(0xFF2D5E3D),
                  size: 20.sp,
                ),
                SizedBox(width: 5.w),
                const Text(
                  "Basket",
                  style: TextStyle(
                    color: Color(0xFF2D5E3D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.favorite_border, color: Colors.white70),
          const Icon(Icons.person_outline, color: Colors.white70),
        ],
      ),
    );
  }
}
