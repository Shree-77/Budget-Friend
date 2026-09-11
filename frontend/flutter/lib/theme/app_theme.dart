import 'package:flutter/material.dart';

/// Centralized theme colors for the entire app
class AppColors {
  // Navigation Bar Colors
  static const Color navBackground = Color(0xFFFCFBFA);
  static const Color navBorder = Color(0xFFE9E7E5);
  static const Color navIconInactive = Color(0xFF858594);
  static const Color navIconActive = Color(0xFF25263A);

  // Accent Colors
  static const Color accentPrimary = Color(0xFF4FC3E8);
  static const Color accentPrimaryDark = Color(0xFF36B8DF);
  static const Color white = Colors.white;

  // Action Colors
  static const Color expenseRed = Color(0xFFE86B6B);
  static const Color incomeGreen = Color(0xFF4CAF8A);
  static const Color budgetBlue = Color(0xFF4FC3E8);
  static const Color budgetOrange = Color(0xFFFFB347);

  // Action Colors - Light backgrounds
  static const Color expenseRedLight = Color(0xFFFCEAEA);
  static const Color incomeGreenLight = Color(0xFFEAF6F1);
  static const Color budgetBlueLight = Color(0xFFE5F3F9);
  static const Color budgetOrangeLight = Color(0xFFFFF4E6);

  // Background Colors
  static const Color darkBg = Color(0xFF071713);
  static const Color darkBgSecondary = Color(0xFF26312E);
  static const Color lightBg = Color(0xFFFCFBFA);
  static const Color cardWhite = Colors.white;

  // Text Colors
  static const Color textDark = Color(0xFF111817);
  static const Color textMuted = Color(0xFF686A7A);
  static const Color textWhite = Colors.white;
  static const Color textWhiteMuted = Colors.white70;

  // Budget Colors
  static const Color budgetFood = Color(0xFFE7AC32);
  static const Color budgetTravel = Color(0xFF48A7F2);
  static const Color budgetShopping = Color(0xFFF17AA8);
  static const Color budgetOther = Color(0xFF6602CA);

  // Background Tints
  static const Color budgetFoodBg = Color(0xFFF6E8D2);
  static const Color budgetTravelBg = Color(0xFFD9EEFF);
  static const Color budgetShoppingBg = Color(0xFFFDE2EC);

  // Safe to Spend Widget Colors
  static const Color safeToSpendProgressBg = Color(0xFFE0E7E4);
  static const Color safeToSpendProgressValue = Color(0xFF35D89A);
  static const Color safeToSpendLabelText = Color(0xFF8D9995);
  static const Color safeToSpendAmountText = Color(0xFFD9E5E2);
  static const Color safeToSpendSubtitleText = Color(0xFF35B981);

  // Shadow Colors (with alpha values)
  static const Color shadowDark = Color(0x1F000000); // Black with 0.12 alpha
  static const Color shadowLight = Color(0x14000000); // Black with 0.08 alpha
}

/// Centralized font sizes and text styles
class AppTypography {
  // Font Sizes
  static const double sizeXSmall = 10.0;
  static const double sizeSmall = 12.0;
  static const double sizeMedium = 14.0;
  static const double sizeLarge = 16.0;
  static const double sizeXLarge = 18.0;
  static const double sizeXXLarge = 20.0;
  static const double sizeTitleSmall = 24.0;
  static const double sizeTitleMedium = 26.0;
  static const double sizeTitleLarge = 28.0;
  static const double sizeTitleXLarge = 32.0;

  // Font Weights
  static const FontWeight weightLight = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightSemiBold = FontWeight.w600;
  static const FontWeight weightBold = FontWeight.w700;

  // Predefined TextStyles
  static const TextStyle labelSmall = TextStyle(
    fontSize: sizeXSmall,
    fontWeight: weightSemiBold,
    color: AppColors.textDark,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: sizeSmall,
    fontWeight: weightMedium,
    color: AppColors.textDark,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: sizeMedium,
    fontWeight: weightMedium,
    color: AppColors.textDark,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: sizeLarge,
    fontWeight: weightMedium,
    color: AppColors.textDark,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: sizeXXLarge,
    fontWeight: weightBold,
    color: AppColors.textDark,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: sizeTitleSmall,
    fontWeight: weightBold,
    color: AppColors.textDark,
  );

  static const TextStyle headingLarge = TextStyle(
    fontSize: sizeTitleLarge,
    fontWeight: weightBold,
    color: AppColors.textDark,
  );

  static const TextStyle headingXLarge = TextStyle(
    fontSize: sizeTitleXLarge,
    fontWeight: weightBold,
    color: AppColors.textDark,
  );
}

/// Centralized spacing and sizing constants
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
}

/// Centralized border radius values
class AppRadius {
  static const double sm = 8.0;
  static const double md = 14.0;
  static const double lg = 18.0;
  static const double xl = 22.0;
  static const double xxl = 38.0;
  static const double full = 30.0;
}

/// Centralized icon sizes
class AppIconSize {
  static const double xs = 16.0;
  static const double sm = 20.0;
  static const double md = 24.0;
  static const double lg = 28.0;
  static const double xl = 32.0;
}

/// Centralized shadow definitions
class AppShadow {
  static const List<BoxShadow> light = [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 25,
      spreadRadius: 1,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(
      color: AppColors.shadowDark,
      blurRadius: 25,
      offset: Offset(0, 8),
    ),
  ];
}
