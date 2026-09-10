import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'card.dart';
import 'common_widgets.dart';

class BudgetSection extends StatelessWidget {
  final bool isCompact;
  final int budgetCount;

  const BudgetSection({
    super.key,
    this.isCompact = false,
    this.budgetCount = 5,
  });

  List<Map<String, dynamic>> _getBudgets() {
    return [
      {
        'iconColor': AppColors.budgetFood,
        'iconBg': AppColors.budgetFoodBg,
        'icon': Icons.restaurant,
        'title': 'Food',
        'left': '₹1,800 left',
        'progress': 0.7,
        'barColor': AppColors.budgetFood,
      },
      {
        'iconColor': AppColors.budgetTravel,
        'iconBg': AppColors.budgetTravelBg,
        'icon': Icons.flight,
        'title': 'Travel',
        'left': '₹3,200 left',
        'progress': 0.4,
        'barColor': AppColors.budgetTravel,
      },
      {
        'iconColor': AppColors.budgetShopping,
        'iconBg': AppColors.budgetShoppingBg,
        'icon': Icons.shopping_bag_outlined,
        'title': 'Shopping',
        'left': '₹2,500 left',
        'progress': 0.6,
        'barColor': AppColors.budgetShopping,
      },
      {
        'iconColor': AppColors.budgetOther,
        'iconBg': AppColors.budgetFoodBg,
        'icon': Icons.category,
        'title': 'Other',
        'left': '₹1,800 left',
        'progress': 0.7,
        'barColor': AppColors.budgetOther,
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    final budgets = _getBudgets();
    final titleSize = isCompact ? AppTypography.sizeTitleSmall : AppTypography.sizeTitleLarge;

    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.xxl, AppSpacing.xxl, AppSpacing.xxl, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your budgets',
            style: TextStyle(
              color: AppColors.textDark,
              fontSize: titleSize,
              fontWeight: AppTypography.weightBold,
            ),
          ),
          SizedBox(height: isCompact ? AppSpacing.md : AppSpacing.xxl),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: budgets.length < budgetCount ? budgets.length : budgetCount,
            itemBuilder: (context, index) {
              final item = budgets[index];
              return CardWidget(
                isCompact: isCompact,
                iconColor: item['iconColor'] as Color,
                iconBg: item['iconBg'] as Color,
                icon: item['icon'] as IconData,
                title: item['title'] as String,
                left: item['left'] as String,
                progress: item['progress'] as double,
                barColor: item['barColor'] as Color,
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: isCompact ? AppSpacing.sm : AppSpacing.md),
          ),
          SizedBox(height: isCompact ? AppSpacing.lg : AppSpacing.xxl),
          Align(
            alignment: Alignment.centerRight,
            child: AppTextButton(
              text: 'See all',
              onPressed: () {},
              textStyle: TextStyle(
                color: AppColors.incomeGreen,
                fontSize: isCompact ? AppTypography.sizeLarge : AppTypography.sizeXLarge,
                fontWeight: AppTypography.weightSemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}