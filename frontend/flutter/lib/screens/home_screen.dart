import 'package:flutter/material.dart';

import 'package:budget_friend/widgets/navigation_bar.dart';
import 'package:budget_friend/widgets/header.dart';
import 'package:budget_friend/widgets/budget_card.dart';

import 'package:budget_friend/screens/budget_screen.dart';
import 'package:budget_friend/screens/ai_screen.dart';
import 'package:budget_friend/screens/profile_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {

    final screens = [
      const HomeDashboard(),
      const BudgetScreen(),
      const AiScreen(),
      const ProfileScreen(),
    ];

    final navigationIndex =
        _selectedScreenIndex >= 2
            ? _selectedScreenIndex + 1
            : _selectedScreenIndex;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F1EE),

      body: IndexedStack(
        index: _selectedScreenIndex,
        children: screens,
      ),

      bottomNavigationBar: CustomNavigationBar(
        currentIndex: navigationIndex,

        onTap: (navIndex) {

          // + button
          if (navIndex == 2) {
            return;
          }

          setState(() {
            _selectedScreenIndex =
                navIndex > 2
                    ? navIndex - 1
                    : navIndex;
          });
        },
      ),
    );
  }
}


class HomeDashboard extends StatelessWidget {

  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {

    final headerHeight =
        MediaQuery.of(context).size.height * 0.55;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: headerHeight,
              child: const Header(),
            ),

            const BudgetCard(),

          ],
        ),
      ),
    );
  }
}