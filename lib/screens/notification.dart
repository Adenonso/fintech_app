import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationListItem> items = [
    NotificationListItem(
        NotificationType: 'Utilities Budget exceeded',
        NotificationDescription:
            'You have received a payment of \$200 from John Doe',
        NotificationTime: 28),
    NotificationListItem(
        NotificationType: 'Limited funds',
        NotificationDescription:
            "Yoou don't have enough funds to complete 'this' transaction",
        NotificationTime: 28),
    NotificationListItem(
        NotificationType: 'Verify NIN',
        NotificationDescription:
            'We noticed you have not lined your NIN to your account',
        NotificationTime: 28),
    NotificationListItem(
        NotificationType: 'Funds refunded',
        NotificationDescription:
            'You have received a refund payment of \$200 from John Doe',
        NotificationTime: 28),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text('Notification'),
            centerTitle: true,
            actions: [
              PopupMenuButton<String>(
                elevation: 15,
                offset: const Offset(0, 40),
                onSelected: (String result) {
                  // Handle the selected option here
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Option 1',
                    child: Text('Mark all as read'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Option 2',
                    child: Text('Remove all'),
                  ),
                ],
                icon: const Icon(Icons.linear_scale_outlined),
              ),
            ],
          ),
          Expanded(
            child: Container(
              // height: 400,
              child: ListView.builder(
                // padding: EdgeInsets.symmetric(vertical: 30),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    title: items[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

////NOTFICATION LIST
class NotificationListItem extends StatelessWidget {
  final String NotificationType;
  final String NotificationDescription;
  final int NotificationTime;

  const NotificationListItem(
      {super.key,
      required this.NotificationType,
      required this.NotificationDescription,
      required this.NotificationTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(NotificationType,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                Text(NotificationDescription,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
              ],
            ),
          ),
          Text("$NotificationTime",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
        ],
      ),
    );
  }
}
