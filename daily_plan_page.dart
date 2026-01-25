import 'package:flutter/material.dart';
import 'favorites_store.dart';

class DailyPlanPage extends StatefulWidget {
  final String day;

  const DailyPlanPage({super.key, required this.day});

  @override
  State<DailyPlanPage> createState() => _DailyPlanPageState();
}

class _DailyPlanPageState extends State<DailyPlanPage> {
  late bool isFav;

  final List<Map<String, String>> meals = [
    {
      "type": "Breakfast",
      "dish": "Oats with Fruits",
      "cal": "350 kcal",
      "nut": "Carbs 55g • Protein 12g • Fat 8g"
    },
    {
      "type": "Lunch",
      "dish": "Dal Rice",
      "cal": "520 kcal",
      "nut": "Carbs 70g • Protein 18g • Fat 10g"
    },
    {
      "type": "Snack",
      "dish": "Sprouts Salad",
      "cal": "180 kcal",
      "nut": "Carbs 20g • Protein 10g • Fat 4g"
    },
    {
      "type": "Dinner",
      "dish": "Chapati & Sabzi",
      "cal": "430 kcal",
      "nut": "Carbs 60g • Protein 14g • Fat 9g"
    },
  ];

  @override
  void initState() {
    super.initState();
    isFav = FavoritesStore.containsDay(widget.day);
  }

  void toggleFavorite() {
    setState(() {
      isFav = !isFav;

      if (isFav) {
        FavoritesStore.addDay({
          "day": widget.day,
          "meals": meals,
        });
      } else {
        FavoritesStore.removeDay(widget.day);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      /* ================= HEADER ================= */
      appBar: AppBar(
        backgroundColor: Colors.green,
        titleSpacing: 16,
        title: Text(
          "NutriGuide - ${widget.day}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      /* ================= BODY ================= */
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: GridView.builder(
          itemCount: meals.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85, // makes cards balanced
          ),
          itemBuilder: (context, index) {
            final meal = meals[index];
            return MealCard(meal: meal);
          },
        ),
      ),

      /* ================= BOTTOM BAR WITH HEART ================= */
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /* ❤️ DAY FAVORITE */
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: isFav ? Colors.red : Colors.grey,
                size: 28,
              ),
              onPressed: toggleFavorite,
            ),

            /* FOOTER ICONS */
            Row(
              children: const [
                Icon(Icons.home, color: Colors.green),
                SizedBox(width: 24),
                Icon(Icons.notifications, color: Colors.grey),
                SizedBox(width: 24),
                Icon(Icons.person, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= MEAL CARD ================= */
class MealCard extends StatelessWidget {
  final Map<String, String> meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              meal["type"]!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              meal["dish"]!,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 4),
            Text(meal["cal"]!, style: const TextStyle(fontSize: 12)),
            Text(meal["nut"]!, style: const TextStyle(fontSize: 11)),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Recipe page coming soon"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                ),
                child: const Text(
                  "View Recipe",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
