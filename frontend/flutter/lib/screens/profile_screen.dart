import 'package:flutter/material.dart';
import 'package:budget_friend/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSpacing.xl),
            Text(
              'Profile Screen',
              style: AppTypography.headingLarge,
            ),
          ],
        ),
      ),
    );
  }
}