import 'package:fintech_app/accounts_pages/account.dart';
import 'package:fintech_app/accounts_pages/add_account.dart';
import 'package:fintech_app/accounts_pages/detailaccount.dart';
import 'package:fintech_app/accounts_pages/edit_account.dart';
import 'package:fintech_app/budgets_pages/budget_main.dart';
import 'package:fintech_app/budgets_pages/create_budget.dart';
import 'package:fintech_app/budgets_pages/detail_budget.dart';
import 'package:fintech_app/budgets_pages/edit_budget.dart';
import 'package:fintech_app/screens/expense.dart';
import 'package:fintech_app/screens/export.dart';
import 'package:fintech_app/screens/income.dart';
import 'package:fintech_app/screens/main_home_screen.dart';
import 'package:fintech_app/screens/main_screen.dart';
import 'package:fintech_app/screens/notification.dart';
import 'package:fintech_app/screens/profile.dart';
import 'package:fintech_app/screens/settings.dart';
import 'package:fintech_app/screens/transfer.dart';
import 'package:fintech_app/settings_folder/currency.dart';
import 'package:fintech_app/settings_folder/language.dart';
import 'package:fintech_app/settings_folder/notification_settings.dart';
import 'package:fintech_app/settings_folder/security.dart';
import 'package:fintech_app/settings_folder/theme.dart';
import 'package:fintech_app/transaction_pages/financial_report.dart';
import 'package:fintech_app/transaction_pages/pre_financial_report.dart';
import 'package:fintech_app/transaction_pages/transaction_main_home.dart';
import 'package:fintech_app/welcome_screens/forgotpassword.dart';
import 'package:fintech_app/welcome_screens/login.dart';
import 'package:fintech_app/welcome_screens/pin_input.dart';
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
      home: MainScreen(),
      routes: {
        '/main_home_screen': (context) => MainHomeScreen(),
        '/expense': (context) => ExpensePage(),
        '/income': (context) => IncomePage(),
        '/transfer': (context) => TransferPage(),
        '/welcome': (context) => WelcomeSwipePages(),
        '/signup': (context) => Signup(),
        '/verification': (context) => Verification(),
        '/login': (context) => Login(),
        '/forgotpassword': (context) => Forgotpassword(),
        // '/pin_input': (context) => PinInputPage(),
        '/notification': (context) => NotificationPage(),
        '/profile': (context) => ProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/currency': (context) => CurrencyPage(),
        '/language': (context) => LanguagePage(),
        '/theme': (context) => ThemePage(),
        '/security': (context) => SecurityPage(),
        '/notification_settings': (context) => NotificationSettingPage(),
        '/export': (context) => ExportPage(),
        '/account': (context) => AccountPage(),
        '/detailaccount': (context) => Detailaccount(),
        '/edit_account': (context) => EditAccount(),
        '/add_account': (context) => AddAccount(),
        '/transaction_main_home': (context) => TransactionMainHome(),
        '/pre_financial_report': (context) => PreFinancialReport(),
        '/financial_report': (context) => FinancialReportPage(),
        '/budget_main': (context) => BudgetMain(),
        '/create_budget': (context) => CreateBudget(),
        '/detail_budget': (context) => DetailBudget(),
        '/edit_budget': (context) => EditBudget()
      },
    );
  }
}
