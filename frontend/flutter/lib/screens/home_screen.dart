import 'package:flutter/material.dart';
import 'package:budget_friend/theme/app_theme.dart';
import 'package:budget_friend/widgets/navigation_bar.dart';
import 'package:budget_friend/widgets/header.dart';
import 'package:budget_friend/widgets/budget_card.dart';
import 'package:budget_friend/widgets/common_widgets.dart';

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

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      extendBody: true,
      body: IndexedStack(
        index: _selectedScreenIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: (navIndex) {
          setState(() {
            _selectedScreenIndex = navIndex;
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
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 360;

          return SingleChildScrollView(
            child: Column(
              children: [
                Header(isCompact: isCompact),
                CompactQuickActionsMenu(
                  onAddExpense: () {
                    debugPrint('Add Expense tapped');
                    // TODO: Navigate to Add Expense screen or show bottom sheet
                  },
                  onAddIncome: () {
                    debugPrint('Add Income tapped');
                    // TODO: Navigate to Add Income screen or show bottom sheet
                  },
                  onAddBudget: () {
                    debugPrint('Add Budget tapped');
                    // TODO: Navigate to Add Budget screen or show bottom sheet
                  },
                ),
                BudgetSection(isCompact: isCompact),
                SizedBox(height: AppSpacing.xxl),
              ],
            ),
          );
        },
      ),
    );
  }
}
