import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppBar(
            title: const Text('Settings'),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Options(Text1: "Currency", Text2: "USD", route: "/currency"),
                Options(
                    Text1: "Language", Text2: "English", route: "/language"),
                Options(Text1: "Theme", Text2: "Dark", route: "/theme"),
                Options(
                    Text1: "Security",
                    Text2: "Fingerprint",
                    route: "/security"),
                Options(
                    Text1: "Notification",
                    Text2: "",
                    route: "/notification_settings"),
                SizedBox(
                  height: 40,
                ),
                Options(Text1: "About", Text2: "", route: ""),
                Options(Text1: "Help", Text2: "", route: ""),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  final String Text1;
  final String Text2;
  final String route;

  const Options(
      {super.key,
      required this.Text1,
      required this.Text2,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Text1,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, route);
              },
              child: Container(
                child: Row(
                  children: [
                    Text(Text2,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

///POP-UP CURRENCY PAGE
