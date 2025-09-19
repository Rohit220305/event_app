import 'package:connected_app/features/home/screens/homapage.dart';
import 'package:connected_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';


import 'features/my_events/screens/my_events_page.dart';
import 'features/profile/screens/profile.dart';
import 'features/routes/app_pages.dart';
import 'features/routes/app_routes.dart';
import 'features/bottom_navigation/bottom_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // home: const LoginScreen(),
      // home: const SignupScreen(),
      // home: const OTPVerificationScreen(),
      // home: const ResetPasswordScreen(),
      // home: const homepage(),
      // home: const ProfilePage(),
      // home: const MyEventsPage(),
      home: const MainBottomNavigation(),
      // initialRoute: AppRoutes.login,
      // routes: AppPages.routes,
    );
  }
}