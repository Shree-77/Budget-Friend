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
