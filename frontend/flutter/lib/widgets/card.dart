import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'common_widgets.dart';

class CardWidget extends StatelessWidget {
  final Color iconColor;
  final Color iconBg;
  final IconData icon;
  final String title;
  final String left;
  final double progress;
  final Color barColor;
  final bool isCompact;

  const CardWidget({
    super.key,
    required this.iconColor,
    required this.iconBg,
    required this.icon,
    required this.title,
    required this.left,
    required this.progress,
    required this.barColor,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconBoxSize = isCompact ? 36.0 : 42.0;
    final iconSize = isCompact ? 22.0 : 28.0;
    final titleSize = isCompact ? 18.0 : 20.0;
    final leftSize = isCompact ? 14.0 : 16.0;
    final spacing = isCompact ? AppSpacing.xs : AppSpacing.sm;

    return AppCard(
      padding: EdgeInsets.all(isCompact ? AppSpacing.md : AppSpacing.lg),
      child: Row(
        children: [
          IconCircleButton(
            icon: icon,
            iconColor: iconColor,
            backgroundColor: iconBg,
            size: iconBoxSize,
            iconSize: iconSize,
            onTap: () {},
          ),
          SizedBox(width: spacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: titleSize,
                          fontWeight: AppTypography.weightSemiBold,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: leftSize,
                        fontWeight: AppTypography.weightSemiBold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isCompact ? 6 : 8),
                ProgressBar(
                  value: progress,
                  valueColor: barColor,
                  minHeight: isCompact ? 8.0 : 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
