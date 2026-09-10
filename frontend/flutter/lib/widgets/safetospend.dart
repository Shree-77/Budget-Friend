import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SafeToSpend extends StatelessWidget {
  const SafeToSpend({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final circleSize = (screenWidth * 0.52).clamp(170.0, 240.0);
    final ringSize = circleSize - 20;
    final labelSize = screenWidth < 360 ? AppTypography.sizeSmall : AppTypography.sizeLarge;
    final amountSize = screenWidth < 360 ? 30.0 : 38.0;
    final subtitleSize = screenWidth < 360 ? 10.0 : 11.0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 360 ? 6.0 : 10.0),
      child: SizedBox(
        width: circleSize,
        height: circleSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: ringSize,
              height: ringSize,
              child: CircularProgressIndicator(
                value: 0.72,
                strokeWidth: screenWidth < 360 ? 15.0 : 20.0,
                backgroundColor: AppColors.safeToSpendProgressBg,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.safeToSpendProgressValue,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Safe to spend',
                  style: TextStyle(
                    color: AppColors.safeToSpendLabelText,
                    fontSize: labelSize,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '₹18,500',
                  style: TextStyle(
                    color: AppColors.safeToSpendAmountText,
                    fontSize: amountSize,
                    fontWeight: AppTypography.weightBold,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'for the rest of September',
                  style: TextStyle(
                    color: AppColors.safeToSpendSubtitleText,
                    fontSize: subtitleSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}