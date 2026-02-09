import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

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
          'Order Tracking',
          style: TextStyle(
            color: const Color(0xFF2D5E3D),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(height: 1.h, color: Colors.grey.shade300),
            SizedBox(height: 10.h),

            Text(
              "Your Order Code: #882610",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "3 items - 37.50 KD",
              style: TextStyle(fontSize: 13.sp, color: Colors.grey),
            ),
            SizedBox(height: 5.h),
            Text(
              "Payment Method : Cash",
              style: TextStyle(fontSize: 13.sp, color: Colors.grey),
            ),

            SizedBox(height: 30.h),

            _buildTimelineItem(
              title: "Delivered",
              subtitle: "Estimated for 10 September, 2021",
              isCompleted: false,
            ),
            _buildTimelineItem(
              title: "Out for delivery",
              subtitle: "Estimated for 10 September, 2021",
              isCompleted: false,
            ),
            _buildTimelineItem(
              title: "Order shipped",
              subtitle: "Estimated for 10 September, 2021",
              isCompleted: true,
            ),
            _buildTimelineItem(
              title: "Confirmed",
              subtitle: "Your order has been confirmed",
              isCompleted: true,
            ),
            _buildTimelineItem(
              title: "Order Placed",
              subtitle: "We have received your order",
              isCompleted: true,
              isLast: true,
            ),

            SizedBox(height: 100.h),

            _buildActionButton(
              text: "Confirm",
              color: const Color(0xFF2D5E3D),
              onTap: () {},
            ),
            SizedBox(height: 15.h),
            _buildActionButton(
              text: "Cancel Order",
              color: const Color(0xFFFF5252),
              onTap: () => _showCancelOrderDialog(context),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required bool isCompleted,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? const Color(0xFF00C853)
                      : Colors.transparent,
                  border: Border.all(color: const Color(0xFF00C853), width: 2),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2.w, color: const Color(0xFF00C853)),
                ),
            ],
          ),
          SizedBox(width: 15.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 51.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          elevation: 0,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showCancelOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CancelOrderDialog(),
    );
  }
}

class CancelOrderDialog extends StatelessWidget {
  const CancelOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      // نغلف المحتوى بـ SingleChildScrollView ليقبل التمرير
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Cancel Order",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reason",
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text(
                          "Please select reason",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        items: ["Delayed", "Changed my mind", "Price too high"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notes",
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      // أضفت تلميحاً داخل الحقل
                      hintText: "Write your notes here...",
                      hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              SizedBox(
                width: double.infinity,
                height: 44.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D5E3D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Confirm Cancelation",
                    style: TextStyle(color: Colors.white, fontSize: 9.sp),
                  ),
                ),
              ),

              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
