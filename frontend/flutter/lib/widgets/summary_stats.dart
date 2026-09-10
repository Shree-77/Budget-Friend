import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SummaryStats extends StatelessWidget {
  final bool isCompact;

  const SummaryStats({
    super.key,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelSize = isCompact ? AppTypography.sizeSmall : AppTypography.sizeLarge;
    final amountSize = isCompact ? AppTypography.sizeLarge : AppTypography.sizeXXLarge;

    return Container(
      margin: const EdgeInsets.only(top: AppSpacing.sm, bottom: AppSpacing.xs),
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? AppSpacing.sm : AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF2D3935),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Row(
        children: [
          _buildStatColumn('Income', '₹60,000', false, labelSize, amountSize),
          _buildDivider(),
          _buildStatColumn('Budgeted', '₹41,500', false, labelSize, amountSize),
          _buildDivider(),
          _buildStatColumn('Spent', '₹23,000', true, labelSize, amountSize),
        ],
      ),
    );
  }

  Widget _buildStatColumn(
    String label,
    String amount,
    bool isSpent,
    double labelSize,
    double amountSize,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFF99A7A3),
                fontSize: labelSize,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              amount,
              style: TextStyle(
                color: isSpent ? const Color(0xFFFFAC5C) : AppColors.textWhite,
                fontSize: amountSize,
                fontWeight: AppTypography.weightBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 46,
      color: const Color(0xFF5D6A66),
    );
  }
}