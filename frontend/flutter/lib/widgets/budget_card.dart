import 'package:flutter/material.dart';
import 'card.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Your budgets',
                style: TextStyle(
                  color: Color(0xFF111817),
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: Color(0xFF35B981),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          CardWidget(
            iconColor: const Color(0xFFE7AC32),
            iconBg: const Color(0xFFF6E8D2),
            icon: Icons.restaurant,
            title: 'Food',
            left: '₹1,800 left',
            progress: 0.7,
            barColor: const Color(0xFFE7AC32),
          ),
          const SizedBox(height: 16),
          CardWidget(
            iconColor: const Color(0xFF48A7F2),
            iconBg: const Color(0xFFD9EEFF),
            icon: Icons.flight,
            title: 'Travel',
            left: '₹1,200 left',
            progress: 0.55,
            barColor: const Color(0xFF48A7F2),
          ),
          const SizedBox(height: 16),
          CardWidget(
            iconColor: const Color(0xFFF17AA8),
            iconBg: const Color(0xFFFDE2EC),
            icon: Icons.shopping_bag_outlined,
            title: 'Shopping',
            left: '₹400 left',
            progress: 0.75,
            barColor: const Color(0xFFFFB347),
          ),
        ],
      ),
    );
 
  }
}