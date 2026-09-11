import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A reusable circular icon button widget
class IconCircleButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  final double iconSize;
  final VoidCallback onTap;

  const IconCircleButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    this.size = 46.0,
    this.iconSize = 24.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}

/// A reusable card container with shadow
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color backgroundColor;
  final double borderRadius;
  final List<BoxShadow>? shadow;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14.0),
    this.backgroundColor = AppColors.cardWhite,
    this.borderRadius = AppRadius.lg,
    this.shadow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: shadow,
        ),
        child: child,
      ),
    );
  }
}

/// A reusable progress bar widget
class ProgressBar extends StatelessWidget {
  final double value;
  final Color backgroundColor;
  final Color valueColor;
  final double minHeight;
  final double borderRadius;

  const ProgressBar({
    super.key,
    required this.value,
    this.backgroundColor = const Color(0xFFE7E7E7),
    this.valueColor = AppColors.accentPrimary,
    this.minHeight = 10.0,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: LinearProgressIndicator(
        value: value,
        minHeight: minHeight,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    );
  }
}

/// A reusable badge/pill widget for notifications
class NotificationBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const NotificationBadge({
    super.key,
    required this.icon,
    this.size = 52.0,
    this.iconSize = 28.0,
    this.backgroundColor = AppColors.darkBgSecondary,
    this.iconColor = AppColors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}

/// A reusable text button widget
class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final EdgeInsets padding;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: textStyle ?? AppTypography.bodyMedium,
      ),
    );
  }
}

/// A reusable container with rounded borders and shadow
class AppContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double borderRadius;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final EdgeInsets padding;

  const AppContainer({
    super.key,
    required this.child,
    this.backgroundColor = AppColors.lightBg,
    this.borderRadius = AppRadius.lg,
    this.border,
    this.boxShadow,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}

/// A reusable section header widget
class SectionHeader extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final VoidCallback? onViewMore;

  const SectionHeader({
    super.key,
    required this.title,
    this.titleStyle,
    this.onViewMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle ?? AppTypography.headingLarge,
          ),
          if (onViewMore != null)
            TextButton(
              onPressed: onViewMore,
              child: const Row(
                children: [
                  Text('View more', style: AppTypography.bodyMedium),
                  SizedBox(width: AppSpacing.xs),
                  Icon(Icons.arrow_forward, size: AppIconSize.sm),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// A reusable quick actions section widget with three action buttons in a single row
class QuickActionsSection extends StatelessWidget {
  final VoidCallback onAddExpense;
  final VoidCallback onAddIncome;
  final VoidCallback onAddBudget;

  const QuickActionsSection({
    super.key,
    required this.onAddExpense,
    required this.onAddIncome,
    required this.onAddBudget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        children: [
          Expanded(
            child: _QuickActionButton(
              icon: Icons.remove,
              label: 'Add Expense',
              sublabel: 'Log a new expense',
              buttonColor: AppColors.expenseRed,
              backgroundColor: AppColors.expenseRedLight,
              onTap: onAddExpense,
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: _QuickActionButton(
              icon: Icons.add,
              label: 'Add Income',
              sublabel: 'Record your income',
              buttonColor: AppColors.incomeGreen,
              backgroundColor: AppColors.incomeGreenLight,
              onTap: onAddIncome,
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: _QuickActionButton(
              icon: Icons.account_balance_wallet,
              label: 'Add Budget',
              sublabel: 'Create a budget',
              buttonColor: AppColors.budgetOrange,
              backgroundColor: AppColors.budgetOrangeLight,
              onTap: onAddBudget,
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual quick action button widget
class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sublabel;
  final Color buttonColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.buttonColor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: buttonColor.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: buttonColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.white,
                size: AppIconSize.md,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                fontWeight: AppTypography.weightSemiBold,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              sublabel,
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.textMuted,
                fontWeight: AppTypography.weightMedium,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// Compact menu items for quick actions - displays below header with smaller size
class CompactQuickActionsMenu extends StatelessWidget {
  final VoidCallback onAddExpense;
  final VoidCallback onAddIncome;
  final VoidCallback onAddBudget;

  const CompactQuickActionsMenu({
    super.key,
    required this.onAddExpense,
    required this.onAddIncome,
    required this.onAddBudget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        border: Border(
          bottom: BorderSide(
            color: AppColors.navBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _CompactMenuItem(
              icon: Icons.remove,
              label: 'Add Expense',
              buttonColor: AppColors.expenseRed,
              backgroundColor: AppColors.expenseRedLight,
              onTap: onAddExpense,
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: _CompactMenuItem(
              icon: Icons.add,
              label: 'Add Income',
              buttonColor: AppColors.incomeGreen,
              backgroundColor: AppColors.incomeGreenLight,
              onTap: onAddIncome,
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: _CompactMenuItem(
              icon: Icons.account_balance_wallet,
              label: 'Add Budget',
              buttonColor: AppColors.budgetOrange,
              backgroundColor: AppColors.budgetOrangeLight,
              onTap: onAddBudget,
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual compact menu item widget
class _CompactMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color buttonColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _CompactMenuItem({
    required this.icon,
    required this.label,
    required this.buttonColor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: buttonColor.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: buttonColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.white,
                size: AppIconSize.sm,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Flexible(
              child: Text(
                label,
                style: AppTypography.labelSmall.copyWith(
                  fontWeight: AppTypography.weightSemiBold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

