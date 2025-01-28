import 'package:fintech_app/widgets/home_recent_transaction.dart';
import 'package:fintech_app/widgets/home_statusbar.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  // int _selectedIndex = 0;

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
