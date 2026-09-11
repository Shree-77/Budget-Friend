import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

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
    final items = [
      _NavItemData(Icons.home_outlined, Icons.home, 'Home', 0),
      _NavItemData(Icons.account_balance_wallet_outlined, Icons.account_balance_wallet, 'My Money', 1),
      _NavItemData(Icons.auto_awesome_outlined, Icons.auto_awesome, 'Ask AI', 2),
      _NavItemData(Icons.person_outline, Icons.person, 'Profile', 3),
    ];

    return SafeArea(
      top: false,
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: AppColors.navBackground,
          border: Border(
            top: BorderSide(
              color: AppColors.navBorder,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: items
              .map(
                (item) => Expanded(
                  child: _NavigationItem(
                    icon: item.icon,
                    selectedIcon: item.selectedIcon,
                    label: item.label,
                    selected: currentIndex == item.index,
                    onTap: () => onTap(item.index),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final int index;

  const _NavItemData(
    this.icon,
    this.selectedIcon,
    this.label,
    this.index,
  );
}

class _NavigationItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          height: 72,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selected ? selectedIcon : icon,
                size: AppIconSize.lg,
                color: selected
                    ? AppColors.navIconActive
                    : AppColors.navIconInactive,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                label,
                style: TextStyle(
                  fontSize: AppTypography.sizeXSmall,
                  fontWeight: selected
                      ? AppTypography.weightBold
                      : AppTypography.weightMedium,
                  color: selected
                      ? AppColors.navIconActive
                      : AppColors.navIconInactive,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
