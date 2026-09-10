import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'common_widgets.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  bool _showAddMenu = false;


  void _toggleAddMenu() {
    setState(() {
      _showAddMenu = !_showAddMenu;
    });
  }

  void _closeAddMenu() {
    if (_showAddMenu) {
      setState(() {
        _showAddMenu = false;
      });
    }
  }

  void _addExpense() {
    _closeAddMenu();

    // TODO: Add Expense
    debugPrint('Add Expense');
  }

  void _addIncome() {
    _closeAddMenu();

    // TODO: Add Income
    debugPrint('Add Income');
  }

  void _addBudget() {
    _closeAddMenu();

    // TODO: Add Budget
    debugPrint('Add Budget');
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafeArea = MediaQuery.paddingOf(context).bottom;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _closeAddMenu,
      child: SizedBox(
        height: 105 + bottomSafeArea,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (_showAddMenu)
              Positioned(
                left: 0,
                right: 0,
                bottom: 82 + bottomSafeArea,
                child: GestureDetector(
                  onTap: () {},
                  child: _AddActionsMenu(
                    onExpense: _addExpense,
                    onIncome: _addIncome,
                    onBudget: _addBudget,
                  ),
                ),
              ),
            Positioned(
              left: 12,
              right: 12,
              bottom: bottomSafeArea > 0 ? bottomSafeArea + 4 : 10,
              child: Container(
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.navBackground,
                  borderRadius: BorderRadius.circular(AppRadius.xxl),
                  border: Border.all(
                    color: AppColors.navBorder,
                    width: 1,
                  ),
                  boxShadow: AppShadow.light,
                ),
                child: Row(
                  children: [
                    // HOME
                    Expanded(
                      child: _NavigationItem(
                        icon: Icons.home_outlined,
                        selectedIcon: Icons.home,
                        label: 'Home',
                        selected: widget.currentIndex == 0,
                        onTap: () {
                          _closeAddMenu();
                          widget.onTap(0);
                        },
                      ),
                    ),

                    // BUDGET
                    Expanded(
                      child: _NavigationItem(
                        icon: Icons.account_balance_wallet_outlined,
                        selectedIcon: Icons.account_balance_wallet,
                        label: 'Budget',
                        selected: widget.currentIndex == 1,
                        onTap: () {
                          _closeAddMenu();
                          widget.onTap(1);
                        },
                      ),
                    ),

                    // CENTER PLUS
                    Expanded(
                      child: _CenterAddButton(
                        isOpen: _showAddMenu,
                        onTap: _toggleAddMenu,
                      ),
                    ),

                    // AI
                    Expanded(
                      child: _NavigationItem(
                        icon: Icons.smart_toy_outlined,
                        selectedIcon: Icons.smart_toy,
                        label: 'AI',
                        selected: widget.currentIndex == 2,
                        onTap: () {
                          _closeAddMenu();
                          widget.onTap(2);
                        },
                      ),
                    ),

                    // PROFILE
                    Expanded(
                      child: _NavigationItem(
                        icon: Icons.person_outline,
                        selectedIcon: Icons.person,
                        label: 'Profile',
                        selected: widget.currentIndex == 3,
                        onTap: () {
                          _closeAddMenu();
                          widget.onTap(3);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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


class _CenterAddButton extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onTap;

  const _CenterAddButton({
    required this.isOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -15),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 52,
          height: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // HEXAGON
              ClipPath(
                clipper: _HexagonClipper(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 52,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isOpen
                        ? AppColors.accentPrimaryDark
                        : AppColors.accentPrimary,
                  ),
                ),
              ),

              // PLUS
              AnimatedRotation(
                turns: isOpen ? 0.125 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: AppIconSize.lg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final w = size.width;
    final h = size.height;

    path.moveTo(w * 0.5, 0);

    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.75);

    path.lineTo(w * 0.5, h);
    path.lineTo(0, h * 0.75);

    path.lineTo(0, h * 0.25);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _AddActionsMenu extends StatelessWidget {
  final VoidCallback onExpense;
  final VoidCallback onIncome;
  final VoidCallback onBudget;

  const _AddActionsMenu({
    required this.onExpense,
    required this.onIncome,
    required this.onBudget,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.navBackground,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(
              color: AppColors.navBorder
            ),
            boxShadow: AppShadow.medium,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _AddAction(
                icon: Icons.remove_circle_outline,
                title: 'Expense',
                color: AppColors.expenseRed,
                onTap: onExpense,
              ),

              const SizedBox(width: AppSpacing.xxxl),

              _AddAction(
                icon: Icons.add_circle_outline,
                title: 'Income',
                color: AppColors.incomeGreen,
                onTap: onIncome,
              ),

              const SizedBox(width: AppSpacing.xxxl),

              _AddAction(
                icon: Icons.account_balance_wallet_outlined,
                title: 'Budget',
                color: AppColors.budgetBlue,
                onTap: onBudget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _AddAction({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: AppIconSize.md,
            ),
          ),

          const SizedBox(height: AppSpacing.xs),

          Text(
            title,
            style: const TextStyle(
              fontSize: AppTypography.sizeXSmall,
              fontWeight: AppTypography.weightSemiBold,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
