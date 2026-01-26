import 'package:flutter/material.dart';

// BMI Screens
import 'screens/bmi/bmi_input_screen.dart';
import 'screens/bmi/bmi_result_screen.dart';

// Reminder Screen
import 'screens/reminder/reminder_screen.dart';

// Favourite Screen
import 'screens/favourite/favourite_screen.dart';

// Notification Screen
import 'screens/notification/notification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // App starts from BMI screen
      initialRoute: '/bmi',

      routes: {
        '/bmi': (context) => BMIInputScreen(),
        '/bmi-result': (context) => BMIResultScreen(),
        '/reminder': (context) => ReminderScreen(),
        '/favourite': (context) => FavouriteScreen(),
        '/notification': (context) => NotificationScreen(),
      },
    );
  }
}
