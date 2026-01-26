import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Dummy notification data
  List<Map<String, String>> notifications = [
    {
      'title': 'Meal Reminder',
      'message': 'Reminder set 15 mins before Breakfast',
      'time': 'Today • 8:00 AM',
    },
    {
      'title': 'Diet Plan Updated',
      'message': 'Your weekly diet plan is ready',
      'time': 'Yesterday • 6:30 PM',
    },
    {
      'title': 'Water Reminder',
      'message': 'Time to drink water',
      'time': 'Yesterday • 4:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 HEADER
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),

      // 🔹 BODY
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                'No notifications yet',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Colors.blue,
                    ),
                    title: Text(
                      notifications[index]['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(notifications[index]['message']!),
                        const SizedBox(height: 4),
                        Text(
                          notifications[index]['time']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
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
