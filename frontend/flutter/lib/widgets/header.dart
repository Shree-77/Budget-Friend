import 'package:budget_friend/widgets/summary_stats.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:budget_friend/widgets/safetospend.dart';
import 'common_widgets.dart';

class Header extends StatelessWidget {
  final bool isCompact;

  const Header({
    super.key,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final greetingSize = isCompact ? AppTypography.sizeMedium : AppTypography.sizeLarge;
    final monthSize = isCompact ? AppTypography.sizeTitleMedium : AppTypography.sizeTitleXLarge;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        AppSpacing.xxl,
        AppSpacing.lg,
        AppSpacing.xxl,
        isCompact ? AppSpacing.md : AppSpacing.xl,
      ),
      decoration: const BoxDecoration(
        color: AppColors.darkBg,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Good morning, Shree',
                style: TextStyle(
                  color: AppColors.textWhiteMuted,
                  fontSize: greetingSize,
                  fontWeight: AppTypography.weightLight,
                ),
              ),
              NotificationBadge(
                icon: Icons.notifications_none_rounded,
                size: isCompact ? 46.0 : 52.0,
                iconSize: isCompact ? 24.0 : 28.0,
              ),
            ],
          ),
          SizedBox(height: isCompact ? AppSpacing.xs : AppSpacing.sm),
          Text(
            'September 2026',
            style: TextStyle(
              color: AppColors.textWhite,
              fontSize: monthSize,
              fontWeight: AppTypography.weightBold,
            ),
          ),
          SizedBox(height: isCompact ? AppSpacing.xs : AppSpacing.sm),
          const Center(child: SafeToSpend()),
          SizedBox(height: isCompact ? AppSpacing.sm : AppSpacing.lg),
          SummaryStats(isCompact: isCompact),
        ],
      ),
    );
  }
}