import 'package:flutter/material.dart';

class SummaryStats extends StatelessWidget {
  const SummaryStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 2),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2D3935),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          _buildStatColumn('Income', '₹60,000', false),
          _buildDivider(),
          _buildStatColumn('Budgeted', '₹41,500', false),
          _buildDivider(),
          _buildStatColumn('Spent', '₹23,000', true),
        ],
      ),
    );
  }

    Widget _buildStatColumn(String label, String amount, bool isSpent) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF99A7A3),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              amount,
              style: TextStyle(
                color: isSpent ? const Color(0xFFFFAC5C) : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
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