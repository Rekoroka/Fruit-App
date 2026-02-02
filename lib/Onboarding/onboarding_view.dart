import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_button.dart';
import 'PageView_Item.dart';
import 'model';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0); // first page
    super.initState();
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: currentIndex == index ? 20.w : 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? const Color(0xFF69A03A)
            : const Color(0xFFE5E5E5),
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex =
                    index; // تحديث الحالة لإعادة بناء الشاشة بالرقم الجديد
              });
            },
            children: [
              OnboardingPageItem(
                model: onboardingModel(
                  image: 'assets/images/onboarding_image.png',
                  title: 'E Shopping',
                  subtitle: 'Explore op organic fruits & grab them',
                ),
              ),
              OnboardingPageItem(
                model: onboardingModel(
                  image: 'assets/images/onboarding_image.png',
                  title: 'Delivery Arrived',
                  subtitle: 'Order is arrived at your place',
                ),
              ),
              OnboardingPageItem(
                model: onboardingModel(
                  image: 'assets/images/onboarding_image.png',
                  title: 'Delivery Arrived',
                  subtitle: 'Order is arrived at your place',
                ),
              ),
            ],
          ),

          Positioned(
            top: 76.h,
            left: 362.w,
            child: Visibility(
              visible: currentIndex != 2, // لو وصلنا لصفحة رقم 2 يختفي
              child: GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF898989),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100.h,
            left: 126.5.w,
            child: CustomButton(
              text: currentIndex == 2 ? 'Get Started' : 'Next',
              onTap: () {
                if (currentIndex < 2) {
                  // لو لسه في أول صفحتين، روح للي بعدها
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
          Positioned(
            bottom: 190.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 3 points
                buildDot(index: 0),
                SizedBox(width: 20.w), // مسافة بين النقط
                buildDot(index: 1),
                SizedBox(width: 20.w),
                buildDot(index: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
