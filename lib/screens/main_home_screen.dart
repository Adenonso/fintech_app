import 'package:fintech_app/widgets/home_recent_transaction.dart';
import 'package:fintech_app/widgets/home_statusbar.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: [
              // Home Status Bar with yellow background
              Container(
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade50,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: HomeStatusbar()),
              IconButton(
                icon: Icon(Icons.sensor_door_outlined),
                onPressed: () {
                  Navigator.pushNamed(context, '/welcome');
                  // Handle your onPressed action here
                },
              ),

              // Home Recent Transaction: graph and list
              Expanded(child: HomeRecentTransaction()),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/transaction_main_home');
                },
                icon: Icon(Icons.swap_horiz_outlined)),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(null),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {}, icon: Icon(Icons.pie_chart_rounded)),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: Icon(Icons.person)),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[800],
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 24),
        unselectedIconTheme: IconThemeData(size: 20),
        // unselectedLabelStyle: TextStyle(inherit: true, color: Colors.black),

        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          _showModalBottomSheet(context); // Add your onPressed code here!
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  // Handle camera action
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Gallery'),
                onTap: () {
                  // Handle gallery action
                },
              ),
              ListTile(
                leading: Icon(Icons.file_upload),
                title: Text('Upload'),
                onTap: () {
                  // Handle upload action
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
