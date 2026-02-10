import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  bool offers = false;
  bool freeDelivery = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter by',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Delivered To", style: TextStyle(color: Colors.grey)),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: "All Areas",
                  items: ["All Areas"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) {},
                ),
              ),
            ),

            SizedBox(height: 15.h),

            _buildCheckItem(
              "Offers",
              offers,
              (val) => setState(() => offers = val!),
            ),
            _buildCheckItem(
              "Free Delivery",
              freeDelivery,
              (val) => setState(() => freeDelivery = val!),
            ),

            SizedBox(height: 25.h),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2D5E3D),
                minimumSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: const Text(
                'Apply Filter',
                style: TextStyle(color: Colors.white),
              ),
            ),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckItem(String title, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(title, style: TextStyle(fontSize: 14.sp)),
      value: value,
      onChanged: onChanged,
      activeColor: const Color(0xFF2D5E3D),
      contentPadding: EdgeInsets.zero,
      checkboxShape: const CircleBorder(),
    );
  }
}
