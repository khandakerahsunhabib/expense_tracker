import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: MainBottomNavScreen(),
    );
  }
}
