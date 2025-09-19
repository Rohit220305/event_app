import 'package:flutter/material.dart';

import '../authentication/screens/login/login.dart';
import '../authentication/screens/reset_password/reset_password.dart';
import '../authentication/screens/signup/otp_verification.dart';
import '../authentication/screens/signup/signup.dart';
import '../home/screens/homapage.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.login: (_) => const LoginScreen(),
    AppRoutes.signup: (_) => const SignupScreen(),
    AppRoutes.otpVerification: (_) => const OTPVerificationScreen(),
    AppRoutes.resetPassword: (_) => const ResetPasswordScreen(),
    AppRoutes.home: (_) => const homepage(),
  };
}