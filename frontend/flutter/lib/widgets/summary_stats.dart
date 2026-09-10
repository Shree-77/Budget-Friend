import 'package:flutter/material.dart';

class SummaryStats extends StatelessWidget {
  final bool isCompact;

  const SummaryStats({
    super.key,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelSize = isCompact ? 12.0 : 16.0;
    final amountSize = isCompact ? 16.0 : 20.0;
    final verticalPadding = isCompact ? 8.0 : 8.0;

    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 2),
      padding: EdgeInsets.symmetric(horizontal: isCompact ? 8 : 12, vertical: verticalPadding),
      decoration: BoxDecoration(
        color: const Color(0xFF2D3935),
        borderRadius: BorderRadius.circular(18),
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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFF99A7A3),
                fontSize: labelSize,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              amount,
              style: TextStyle(
                color: isSpent ? const Color(0xFFFFAC5C) : Colors.white,
                fontSize: amountSize,
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