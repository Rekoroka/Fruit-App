import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/favorite/favorite_screen.dart';
import 'package:fruit_app/home/seller_details.dart';
import 'package:fruit_app/more/terms_and_conditions.dart';
import 'package:fruit_app/basket/checkout/order_error.dart';
import 'package:fruit_app/orders/my_orders_screen.dart';
import 'package:fruit_app/orders/order_tracking_screen.dart';
import 'package:fruit_app/basket/checkout/order_success.dart';
import 'package:fruit_app/basket/checkout/delivery_time_screen.dart';
import 'package:fruit_app/basket/checkout/delivery_address_screen.dart';
import 'package:fruit_app/basket/checkout/payment.dart';
import 'package:fruit_app/basket/basket_screen.dart';
import 'package:fruit_app/more/conect_us.dart';
import 'package:fruit_app/home/fruit_shop.dart';
import 'package:fruit_app/more/edit_profile_screen.dart';
import 'package:fruit_app/more/more_screen.dart';
import 'package:fruit_app/home/home_screen.dart';
import 'package:fruit_app/auth/otp_view.dart';
import 'package:fruit_app/auth/login_screen.dart';
import 'package:fruit_app/auth/forget_password_screen.dart';
import 'package:fruit_app/auth/signup_screen.dart';
import 'package:fruit_app/Onboarding/onboarding_view.dart';
import 'package:fruit_app/auth/welcome_screen.dart';
import 'package:fruit_app/auth/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/', // البداية من شاشة Splash
          routes: {
            '/': (context) => const SplashScreen(), // شاشة 1
            '/onboarding': (context) => const OnboardingView(), // شاشات 2-4
            '/welcome': (context) => const WelcomeScreen(), // شاشة 5
            '/login': (context) => const LoginScreen(), // شاشة 7
            '/forgot_password': (context) =>
                const ForgetPasswordScreen(), // شاشة 8
            '/otp': (context) => const OTPView(), // شاشة 9
            '/signup': (context) => const SignUpScreen(), // شاشة 6
            '/home': (context) => const HomeScreen(), // شاشة 10
            '/saller_details': (context) => const SellerDetails(), // شاشة 11
            '/fruit_shop': (context) => const FruitShop(), // شاشة 13
            '/basket': (context) => const BasketScreen(), // شاشة 16
            '/checkout': (context) => const DeliveryTimeScreen(), // شاشة 17
            '/delivery_address': (context) =>
                const DeliveryAddressScreen(), // شاشة 18
            '/payment': (context) => const PaymentScreen(), // شاشة 19
            '/order_success': (context) =>
                const OrderSuccessScreen(), // شاشة 20
            '/order_error': (context) => const OrderErrorScreen(), // شاشة 21
            '/my_orders': (context) => const MyOrdersScreen(), // شاشة 22
            '/order_tracking': (context) =>
                const OrderTrackingScreen(), // شاشة 23
            '/favorite': (context) => const FavoriteScreen(), // شاشة 26
            '/more': (context) => const MoreScreen(), // شاشة 12
            '/edit_profile': (context) => const EditProfileScreen(), // شاشة 24
            '/terms': (context) => const TermsAndConditionsScreen(), // شاشة 25
            '/contact_us': (context) => const ContactUsScreen(), // شاشة 26
          },
        );
      },
    );
  }
}
