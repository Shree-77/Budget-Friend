import 'package:flutter/material.dart';

class SafeToSpend extends StatelessWidget {
  const SafeToSpend({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 240,
        height: 240,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 220,
              height: 220,
              child: CircularProgressIndicator(
                value: 0.72,
                strokeWidth: 20,
                backgroundColor: const Color(0xFFE0E7E4),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF35D89A),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Safe to spend',
                  style: TextStyle(
                    color: Color(0xFF8D9995),
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '₹18,500',
                  style: TextStyle(
                    color: Color(0xFFD9E5E2),
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'for the rest of September',
                  style: TextStyle(
                    color: Color(0xFF35B981),
                    fontSize: 12,
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