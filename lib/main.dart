import 'package:fintech_app/screens/expense.dart';
import 'package:fintech_app/screens/income.dart';
import 'package:fintech_app/screens/main_home_screen.dart';
import 'package:fintech_app/screens/transfer.dart';
import 'package:fintech_app/welcome_screens/forgotpassword.dart';
import 'package:fintech_app/welcome_screens/login.dart';
import 'package:fintech_app/welcome_screens/signup.dart';
import 'package:fintech_app/welcome_screens/verification.dart';
import 'package:fintech_app/welcome_screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: MainHomeScreen(),
      routes: {
        '/expense': (context) => ExpensePage(),
        '/income': (context) => IncomePage(),
        '/transfer': (context) => TransferPage(),
        '/welcome': (context) => WelcomeSwipePages(),
        '/signup': (context) => Signup(),
        '/verification': (context) => Verification(),
        '/login': (context) => Login(),
        '/forgotpassword': (context) => Forgotpassword(),
      },
    );
  }
}
