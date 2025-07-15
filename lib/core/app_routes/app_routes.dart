// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:kuriosity/view/components/bottom_nav_bar/bottom_nav_bar.dart';
import '../../view/screens/auth/screens/forget_password_screen.dart';
import '../../view/screens/auth/screens/otp_verify_screen.dart';
import '../../view/screens/auth/screens/phone_input_screen.dart';
import '../../view/screens/auth/screens/reset_password_screen.dart';
import '../../view/screens/auth/screens/sign_in_screen.dart';
import '../../view/screens/auth/screens/sign_up_screen.dart';
import '../../view/screens/chat/screens/chats_list_screen.dart';
import '../../view/screens/home/screens/home_screen.dart';
import '../../view/screens/chat/screens/chats_screen.dart';
import '../../view/screens/onboarding/first_onbording_screen.dart';
import '../../view/screens/onboarding/secend_onbording_screen.dart';
import '../../view/screens/onboarding/third_onbording_screen.dart';
import '../../view/screens/profile/screens/followers_following_screen.dart';
import '../../view/screens/profile/screens/profile_screen.dart';
import '../../view/screens/splash_screen/splash_screens.dart';

class AppRoutes {
  ///===========================Spalash & Onboarding==========================
  static const String splashScreen = "/SplashScreen";
  static const String signUpScreen = "/SignUpScreen";
  static const String secendOnbordingScreen = "/SecendOnbordingScreen";
  static const String thirdOnbordingScreen = "/ThirdOnbordingScreen";

  ///===========================Authentication==========================
  static const String signInScreen = "/SignInScreen";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen";
  static const String otpVerifyScreen = "/OtpVerifyScreen";
  static const String firstOnbordingScreen = "/FirstOnbordingScreen";
  static const String resetPasswordScreen = "/ResetPasswordScreen";
  static const String phoneInputScreen = "/PhoneInputScreen";

  ///===========================Home==========================
  static const String homeScreen = "/HomeScreen";
  static const String bottomNavBar = "/BottomNavBar";

  ///===========================Chats==========================
  static const String chatsListScreen = "/ChatsListScreen";
  static const String chatsScreen = "/ChatsScreen";

  ///===========================Profile==========================
  static const String profileScreen = "/ProfileScreen";
  static const String followersFollowingScreen = "/FollowersFollowingScreen";
  static List<GetPage> routes = [
    ///===========================Spalash & Onboarding==========================
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: firstOnbordingScreen, page: () => FirstOnbordingScreen()),
    GetPage(name: secendOnbordingScreen, page: () => SecendOnbordingScreen()),
    GetPage(name: thirdOnbordingScreen, page: () => ThirdOnbordingScreen()),

    ///===========================Authentication==========================
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: otpVerifyScreen, page: () => OtpVerifyScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: phoneInputScreen, page: () => PhoneInputScreen()),

    ///===========================Home==========================
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: bottomNavBar, page: () => BottomNavBar()),

    ///===========================Chats==========================
    GetPage(name: chatsListScreen, page: () => ChatsListScreen()),
    GetPage(name: chatsScreen, page: () => ChatsScreen()),

    ///===========================Profile==========================
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(
      name: followersFollowingScreen,
      page: () => FollowersFollowingScreen(),
    ),
  ];
}
