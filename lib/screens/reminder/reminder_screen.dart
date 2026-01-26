import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  // Dropdown value
  String _selectedTime = '10 mins';

  // Radio button value
  String _selectedMeal = 'Breakfast';

  final List<String> reminderTimes = [
    '10 mins',
    '15 mins',
    '20 mins',
    '30 mins',
  ];

  void setReminder() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Reminder set $_selectedTime before $_selectedMeal',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 HEADER
      appBar: AppBar(
        title: const Text('Meal Reminder'),
        centerTitle: true,
      ),

      // 🔹 BODY
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Dropdown label
            const Text(
              'Set reminder before',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // 🔹 DROPDOWN
            DropdownButtonFormField<String>(
              value: _selectedTime,
              items: reminderTimes
                  .map(
                    (time) => DropdownMenuItem(
                      value: time,
                      child: Text(time),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTime = value!;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            // Meal selection text
            const Text(
              'Select before which meal you want to set the reminder',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // 🔹 RADIO BUTTONS
            RadioListTile(
              title: const Text('Breakfast'),
              value: 'Breakfast',
              groupValue: _selectedMeal,
              onChanged: (value) {
                setState(() {
                  _selectedMeal = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('Lunch'),
              value: 'Lunch',
              groupValue: _selectedMeal,
              onChanged: (value) {
                setState(() {
                  _selectedMeal = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('Snack'),
              value: 'Snack',
              groupValue: _selectedMeal,
              onChanged: (value) {
                setState(() {
                  _selectedMeal = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('Dinner'),
              value: 'Dinner',
              groupValue: _selectedMeal,
              onChanged: (value) {
                setState(() {
                  _selectedMeal = value.toString();
                });
              },
            ),

            const Spacer(),

            // 🔹 SET REMINDER BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: setReminder,
                child: const Text('Set Reminder'),
              ),
            ),
          ],
        ),
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
