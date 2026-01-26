import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// ================= HEADER =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        title: const Text(
          "NutriGuide",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      /// ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// DISH NAME
            const Text(
              "Vegetable Oats Upma",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            /// IMAGE CENTER
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/oats_upma.jpg',
                  height: 420,
                  width: 320,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// ================= CARDS =================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// NUTRITION CARD
                SizedBox(
                  width: 500,
                  height: 500,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Nutrition",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 18),
                          Text(
                            "Calories: 220 kcal\n"
                            "Protein: 8 g\n"
                            "Carbs: 34 g\n"
                            "Fats: 6 g\n"
                            "Fibre: 5 g",
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                /// RECIPE CARD
                SizedBox(
                  width: 500,
                  height: 500,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Recipe",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 18),
                          Text(
                            "1. Heat oil in a pan\n"
                            "2. Add chopped vegetables\n"
                            "3. Add oats and stir\n"
                            "4. Pour water and cook\n"
                            "5. Serve hot",
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

      /// ================= FOOTER =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}


