import 'package:flutter/material.dart';
import 'card.dart';

class BudgetSection extends StatelessWidget {
  final bool isCompact;
  final int budgetCount;

  const BudgetSection({
    super.key,
    this.isCompact = false,
    this.budgetCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    final budgets = [
      {
        'iconColor': const Color(0xFFE7AC32),
        'iconBg': const Color(0xFFF6E8D2),
        'icon': Icons.restaurant,
        'title': 'Food',
        'left': '₹1,800 left',
        'progress': 0.7,
        'barColor': const Color(0xFFE7AC32),
      },
      {
        'iconColor': const Color(0xFF48A7F2),
        'iconBg': const Color(0xFFD9EEFF),
        'icon': Icons.flight,
        'title': 'Travel',
        'left': '₹3,200 left',
        'progress': 0.4,
        'barColor': const Color(0xFF48A7F2),
      },
      {
        'iconColor': const Color(0xFFF17AA8),
        'iconBg': const Color(0xFFFDE2EC),
        'icon': Icons.shopping_bag_outlined,
        'title': 'Shopping',
        'left': '₹2,500 left',
        'progress': 0.6,
        'barColor': const Color(0xFFFFB347),
      },
      {
        'iconColor': const Color(0xFFE7AC32),
        'iconBg': const Color(0xFFF6E8D2),
        'icon': Icons.restaurant,
        'title': 'test',
        'left': '₹1,800 left',
        'progress': 0.7,
        'barColor': const Color.fromARGB(255, 102, 14, 202),
      }
     
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your budgets',
            style: TextStyle(
              color: const Color(0xFF111817),
              fontSize: isCompact ? 24 : 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: isCompact ? 12 : 18),
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
            separatorBuilder: (context, index) => SizedBox(height: isCompact ? 10 : 12),
          ),
          SizedBox(height: isCompact ? 14 : 18),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'See all',
                    style: TextStyle(
                      color: const Color(0xFF35B981),
                      fontSize: isCompact ? 16 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: Color(0xFF35B981),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}