import 'package:budget_friend/widgets/summary_stats.dart';
import 'package:flutter/material.dart';
import 'package:budget_friend/widgets/safetospend.dart';

class Header extends StatelessWidget {
  final bool isCompact;

  const Header({
    super.key,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final greetingSize = isCompact ? 17.0 : 20.0;
    final monthSize = isCompact ? 26.0 : 32.0;
    final badgeSize = isCompact ? 46.0 : 52.0;
    final iconSize = isCompact ? 24.0 : 28.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, 20, 24, isCompact ? 14 : 18),
      decoration: const BoxDecoration(
        color: Color(0xFF071713),
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
                  color: Colors.white70,
                  fontSize: greetingSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                width: badgeSize,
                height: badgeSize,
                decoration: const BoxDecoration(
                  color: Color(0xFF26312E),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: iconSize,
                ),
              ),
            ],
          ),
          SizedBox(height: isCompact ? 6 : 8),
          Text(
            'September 2026',
            style: TextStyle(
              color: Colors.white,
              fontSize: monthSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: isCompact ? 4 : 6),
          const Center(child: SafeToSpend()),
          SizedBox(height: isCompact ? 8 : 12),
          SummaryStats(isCompact: isCompact),
        ],
      ),
    );
  }
}