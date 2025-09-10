import 'package:connected_app/features/home/screens/homapage.dart';
import 'package:connected_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';

import 'features/authentication/screens/login/login.dart';
import 'features/authentication/screens/reset_password/reset_password.dart';
import 'features/authentication/screens/signup/otp_verification.dart';
import 'features/authentication/screens/signup/signup.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      // home: const LoginScreen(),
      // home: const SignupScreen(),
      // home: const OTPVerificationScreen(),
      // home: const ResetPasswordScreen(),
      home: const homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}