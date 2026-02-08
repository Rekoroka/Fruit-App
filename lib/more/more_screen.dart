import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/bottom_navigator_bar.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  int currentIndex = 4;
  String selectedLanguage = 'English';

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLanguageOption(
                  'العربية',
                  selectedLanguage == 'Arabic',
                  () => setDialogState(() => selectedLanguage = 'Arabic'),
                ),
                SizedBox(height: 10.h),
                _buildLanguageOption(
                  'English',
                  selectedLanguage == 'English',
                  () => setDialogState(() => selectedLanguage = 'English'),
                ),
                SizedBox(height: 25.h),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D5E3D),
                    minimumSize: Size(double.infinity, 45.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Fruit Market',
          style: TextStyle(
            color: const Color(0xFF2D5E3D),
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        // --- إضافة الخط الرمادي أسفل الـ AppBar ---
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(color: Colors.grey.shade200, height: 1.0.h),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),

            _buildProfileSection(),

            SizedBox(height: 25.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D5E3D),
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 30.h),

            _buildMenuItem(Icons.person_outline, 'Profile', () {}),
            _buildMenuItem(Icons.format_list_numbered_rtl, 'My Orders', () {}),
            _buildMenuItem(Icons.favorite_border, 'Favorite', () {}),
            _buildMenuItem(
              Icons.language_outlined,
              'Language',
              _showLanguageDialog,
            ),
            _buildMenuItem(Icons.headset_mic_outlined, 'Support', () {}),
            _buildMenuItem(
              Icons.description_outlined,
              'Terms & Conditions',
              () {},
            ),
            _buildMenuItem(Icons.info_outline, 'About Us', () {}),

            SizedBox(height: 100.h),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_outline,
                size: 50.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Text(
          'Welcome, Fruit Market',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildLanguageOption(
    String title,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Container(
              width: 22.w,
              height: 22.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF2D5E3D) : Colors.grey,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Icon(
                        Icons.check,
                        size: 14.sp,
                        color: const Color(0xFF2D5E3D),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 12.w),
            Text(title, style: TextStyle(fontSize: 16.sp)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 70.h,
      margin: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2D5E3D),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (index) {
          return CustomNavItem(
            icon: _getIcon(index),
            label: _getLabel(index),
            isSelected: currentIndex == index,
            onTap: () => setState(() => currentIndex = index),
          );
        }),
      ),
    );
  }

  IconData _getIcon(int index) {
    List<IconData> icons = [
      Icons.home,
      Icons.list,
      Icons.shopping_basket,
      Icons.favorite,
      Icons.more_horiz,
    ];
    return icons[index];
  }

  String _getLabel(int index) {
    List<String> labels = ["Home", "Orders", "Basket", "Fav", "More"];
    return labels[index];
  }
}
