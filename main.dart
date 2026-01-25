import 'package:flutter/material.dart';
import 'weekly_plan_page.dart';


void main() {
  runApp(const NutriGuideApp());
}

class NutriGuideApp extends StatelessWidget {
  const NutriGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriGuide',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool breakfast = false;
  bool lunch = false;
  bool snack = false;
  bool dinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      /* ================= HEADER ================= */
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "NutriGuide",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      /* ================= MAIN CONTENT ================= */
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /* ===== Tracker Card ===== */
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today's Meal Tracker",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    CheckboxListTile(
                      title: const Text("Breakfast"),
                      value: breakfast,
                      onChanged: (val) {
                        setState(() => breakfast = val!);
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("Lunch"),
                      value: lunch,
                      onChanged: (val) {
                        setState(() => lunch = val!);
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("Snack"),
                      value: snack,
                      onChanged: (val) {
                        setState(() => snack = val!);
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("Dinner"),
                      value: dinner,
                      onChanged: (val) {
                        setState(() => dinner = val!);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /* ===== Feature Boxes ===== */
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                FeatureBox(icon: Icons.fastfood, label: "Craving"),
                FeatureBox(icon: Icons.alarm, label: "Reminder"),
                FeatureBox(icon: Icons.fitness_center, label: "Fitness"),
                FeatureBox(icon: Icons.insights, label: "Progress"),
              ],
            ),

            const SizedBox(height: 30),

            /* ===== Generate Plan Button ===== */
            Center(
              child: ElevatedButton(
                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const WeeklyPlanPage(),
    ),
  );
},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Generate Plan",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
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

/* ================= Feature Box Widget ================= */
class FeatureBox extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureBox({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.green),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
