import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Color iconColor;
  final Color iconBg;
  final IconData icon;
  final String title;
  final String left;
  final double progress;
  final Color barColor;
  final bool isCompact;

  const CardWidget({
    super.key,
    required this.iconColor,
    required this.iconBg,
    required this.icon,
    required this.title,
    required this.left,
    required this.progress,
    required this.barColor,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconBoxSize = isCompact ? 36.0 : 42.0;
    final iconSize = isCompact ? 22.0 : 28.0;
    final titleSize = isCompact ? 18.0 : 20.0;
    final leftSize = isCompact ? 14.0 : 16.0;

    return Container(
      padding: EdgeInsets.all(isCompact ? 12 : 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: iconBoxSize,
            height: iconBoxSize,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: iconColor, size: iconSize),
          ),
          SizedBox(width: isCompact ? 10 : 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xFF111817),
                          fontSize: titleSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xFF111817),
                        fontSize: leftSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isCompact ? 6 : 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: isCompact ? 8 : 10,
                    backgroundColor: const Color(0xFFE7E7E7),
                    valueColor: AlwaysStoppedAnimation<Color>(barColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
