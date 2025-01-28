import 'package:fintech_app/budgets_pages/budget_main.dart';
import 'package:fintech_app/screens/main_home_screen.dart';
import 'package:fintech_app/screens/profile.dart';
import 'package:fintech_app/transaction_pages/transaction_main_home.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;

  @override
  void initState() {
    page = [
      const MainHomeScreen(),
      const TransactionMainHome(),
      const MainHomeScreen(),
      const BudgetMain(),
      const ProfilePage(),
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple[800],
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 24),
        unselectedIconTheme: IconThemeData(size: 20),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz_outlined),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(null),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_rounded),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: page[selectedIndex],
    );
  }
}
