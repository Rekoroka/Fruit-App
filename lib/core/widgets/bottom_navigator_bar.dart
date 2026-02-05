import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,

              color: isSelected ? const Color(0xFF2D5E3D) : Colors.white,
              size: 24.sp,
            ),
            if (isSelected) ...[
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  color: const Color(0xFF2D5E3D),
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
