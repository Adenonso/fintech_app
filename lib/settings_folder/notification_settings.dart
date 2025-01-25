import 'package:flutter/material.dart';

class NotificationSettingPage extends StatefulWidget {
  @override
  _NotificationSettingPageState createState() =>
      _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {
  final List<String> _notifications = [
    'Expense Alert',
    'Budget',
    'Tips & Articles',
  ];

  final List<String> _description = [
    'Get notification about your expense',
    'Get notification when your budget is exceeding the limit',
    'Small and useful pieces of practical financial advice'
  ];

  final Map<String, bool> _notificationSettings = {
    'Expense Alert': false,
    'Budget': false,
    'Tips & Articles': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SwitchListTile(
                  title: Text(
                    _notifications[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    _description[index],
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  value: _notificationSettings[_notifications[index]]!,
                  activeColor: Colors.deepPurple,
                  onChanged: (bool value) {
                    setState(() {
                      _notificationSettings[_notifications[index]] = value;
                    });
                  },
                ),
                // Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
