import 'package:flutter/material.dart';

import 'screens/register/register_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/meal_detail/meal_detail_screen.dart'; // 👈 ADD THIS
import 'screens/craving/craving_screen.dart';



void main() {
  runApp(const NutriGuideApp());
}

class NutriGuideApp extends StatelessWidget {
  const NutriGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Start from Register
      initialRoute: '/meal_detail',

      routes: {
        '/register': (context) => const RegisterScreen(),
        '/otp': (context) => const OtpScreen(),
        '/login': (context) => const LoginScreen(),
        '/meal_detail': (context) => const MealDetailScreen(), // 👈 ADD THIS
        '/craving': (context) => const CravingScreen(),
      },
    );
  }
}
