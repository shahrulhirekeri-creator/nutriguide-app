import 'package:flutter/material.dart';
import 'daily_plan_page.dart';


class WeeklyPlanPage extends StatelessWidget {
  const WeeklyPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      /* ================= HEADER ================= */
      appBar: AppBar(
        backgroundColor: Colors.green,
        titleSpacing: 16,
        title: const Text(
          "NutriGuide",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      /* ================= MAIN CONTENT ================= */
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          DayCard(day: "Monday"),
          DayCard(day: "Tuesday"),
          DayCard(day: "Wednesday"),
          DayCard(day: "Thursday"),
          DayCard(day: "Friday"),
          DayCard(day: "Saturday"),
          DayCard(day: "Sunday"),
        ],
      ),

      /* ================= FOOTER ================= */
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Alerts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

/* ================= OVAL DAY CARD ================= */
class DayCard extends StatelessWidget {
  final String day;

  const DayCard({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DailyPlanPage(day: day),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(vertical: 22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            day,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
