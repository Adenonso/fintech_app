import 'package:flutter/material.dart';

class ExportPage extends StatefulWidget {
  const ExportPage({super.key});

  @override
  State<ExportPage> createState() => _ExportPageState();
}

class _ExportPageState extends State<ExportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 20),
          AppBar(
            title: const Text('Export Data'),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What data do you want to export?',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'All',
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          'All',
                          'Debits',
                          'Credits',
                        ].map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 20),
                      Text(
                        'When date range?',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'date range',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Last 30 days', 'Last 60 days', 'Last 90 days']
                            .map((wallet) {
                          return DropdownMenuItem(
                            value: wallet,
                            child: Text(wallet),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 20),
                      Text(
                        'What format do you want to export?',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'format',
                          border: OutlineInputBorder(),
                        ),
                        items: ['CSV', 'PDF', 'WORD'].map((wallet) {
                          return DropdownMenuItem(
                            value: wallet,
                            child: Text(wallet),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 180),
                      //EXPORT BUTTON
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExportDone()),
                          );
                        },
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: double.infinity,
                          child: Row(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_download_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                'Export',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExportDone extends StatelessWidget {
  const ExportDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                width: 300, height: 350, 'assets/images/welcomeicon2.png'),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                'Check your email, wesend you the financial report. In certain cases, it might take a little longer, depending on the time period and the volume of activity',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/',
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0), // Add some padding
                decoration: BoxDecoration(
                  color: Colors
                      .deepPurple, // Background color for the first container
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                child: Center(
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
