import 'package:flutter/material.dart';

class SafeToSpend extends StatelessWidget {
  const SafeToSpend({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final circleSize = (screenWidth * 0.52).clamp(170.0, 240.0);
    final ringSize = circleSize - 20;
    final labelSize = screenWidth < 360 ? 15.0 : 18.0;
    final amountSize = screenWidth < 360 ? 30.0 : 38.0;
    final subtitleSize = screenWidth < 360 ? 10.0 : 11.0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 360 ? 6.0 : 10.0),
      child: SizedBox(
        width: circleSize,
        height: circleSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: ringSize,
              height: ringSize,
              child: CircularProgressIndicator(
                value: 0.72,
                strokeWidth: screenWidth < 360 ? 15.0 : 20.0,
                backgroundColor: const Color(0xFFE0E7E4),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF35D89A),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Safe to spend',
                  style: TextStyle(
                    color: const Color(0xFF8D9995),
                    fontSize: labelSize,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '₹18,500',
                  style: TextStyle(
                    color: const Color(0xFFD9E5E2),
                    fontSize: amountSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'for the rest of September',
                  style: TextStyle(
                    color: const Color(0xFF35B981),
                    fontSize: subtitleSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}