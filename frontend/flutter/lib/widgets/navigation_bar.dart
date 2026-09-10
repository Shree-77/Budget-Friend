import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final safeBottom = MediaQuery.paddingOf(context).bottom;
    final navHeight = (screenWidth * 0.18).clamp(64.0, 76.0) + safeBottom;
    final iconSize = (screenWidth * 0.055).clamp(18.0, 24.0);
    final labelSize = (screenWidth * 0.028).clamp(9.0, 12.0);

    final items = [
      const _NavItem(icon: Icons.home_outlined, label: 'Home', index: 0),
      const _NavItem(icon: Icons.account_balance_wallet, label: 'Money', index: 1),
      const _NavItem(icon: Icons.smart_toy_outlined, label: 'AI', index: 2),
      const _NavItem(icon: Icons.person_outline, label: 'Profile', index: 3),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
      child: SafeArea(
        top: false,
        child: Container(
          height: navHeight,
          padding: EdgeInsets.only(bottom: safeBottom > 0 ? safeBottom * 0.45 : 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F7F5),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(
              color: const Color(0xFFE4E1DB),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: items.map((item) {
              final isSelected = currentIndex == item.index;

              return Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => onTap(item.index),
                    borderRadius: BorderRadius.circular(18),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      margin: EdgeInsets.symmetric(
                        horizontal: isSelected ? 8 : 10,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFEAF8F4)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.icon,
                            size: iconSize,
                            color: isSelected
                                ? const Color(0xFF111817)
                                : const Color(0xFF7B8884),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: labelSize,
                              color: isSelected
                                  ? const Color(0xFF111817)
                                  : const Color(0xFF7B8884),
                              fontWeight:
                                  isSelected ? FontWeight.w700 : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final int index;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.index,
  });
}
