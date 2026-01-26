import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  // Dummy favourite meals list
  List<String> favouriteMeals = [
    'Oats with Fruits',
    'Grilled Chicken Salad',
    'Vegetable Soup',
    'Paneer Stir Fry',
  ];

  void removeFromFavourite(int index) {
    setState(() {
      favouriteMeals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 HEADER
      appBar: AppBar(
        title: const Text('Favourite Meals'),
        centerTitle: true,
      ),

      // 🔹 BODY
      body: favouriteMeals.isEmpty
          ? const Center(
              child: Text(
                'No favourite meals added',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favouriteMeals.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    title: Text(
                      favouriteMeals[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => removeFromFavourite(index),
                    ),
                  ),
                );
              },
            ),

      // 🔹 FOOTER
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              'NutriGuide © 2026',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ),
      ),
    );
  }
}
