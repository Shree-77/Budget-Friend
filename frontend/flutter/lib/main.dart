import 'package:flutter/material.dart';
import 'package:budget_friend/screens/home_screen.dart';


void main() => runApp(BudgetFriend());

class BudgetFriend extends StatelessWidget {
  const BudgetFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Budget Friend",
      home: const HomeScreen()
    );
  }
}