import 'package:flutter/material.dart';

class BMIInputScreen extends StatefulWidget {
  @override
  State<BMIInputScreen> createState() => _BMIInputScreenState();
}

class _BMIInputScreenState extends State<BMIInputScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  void calculateBMI() {
    // 1️⃣ Empty field validation
    if (heightController.text.isEmpty ||
        weightController.text.isEmpty ||
        ageController.text.isEmpty) {
      _showMessage("All fields are required");
      return;
    }

    // 2️⃣ Safe parsing
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);
    int? age = int.tryParse(ageController.text);

    if (height == null || weight == null || age == null) {
      _showMessage("Please enter valid numbers");
      return;
    }

    // 3️⃣ Health range validation
    if (height < 50 || height > 250) {
      _showMessage("Height must be between 50 and 250 cm");
      return;
    }

    if (weight < 20 || weight > 300) {
      _showMessage("Weight must be between 20 and 300 kg");
      return;
    }

    if (age < 5 || age > 120) {
      _showMessage("Please enter a valid age");
      return;
    }

    // 4️⃣ BMI calculation
    height = height / 100; // cm → meters
    double bmi = weight / (height * height);

    String category;
    if (bmi < 18.5) {
      category = "Underweight";
    } else if (bmi < 25) {
      category = "Normal";
    } else if (bmi < 30) {
      category = "Overweight";
    } else {
      category = "Obese";
    }

    // 5️⃣ Navigate to result screen
    Navigator.pushNamed(
      context,
      '/bmi-result',
      arguments: {
        'bmi': bmi,
        'category': category,
      },
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Height (cm)",
              ),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Weight (kg)",
              ),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Age",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              child: const Text("Calculate BMI"),
            ),
          ],
        ),
      ),
    );
  }
}
