import 'package:flutter/material.dart';
import 'package:budget_friend/theme/app_theme.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSpacing.xl),
            Text(
              'Budget Screen',
              style: AppTypography.headingLarge,
            ),
          ],
        ),
      ),
    );
  }
}