import 'package:flutter/material.dart';
import 'package:budget_friend/theme/app_theme.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSpacing.xl),
            Text(
              'AI Screen',
              style: AppTypography.headingLarge,
            ),
          ],
        ),
      ),
    );
  }
}