import 'package:flutter/material.dart';

class AppbarContent extends StatelessWidget {
  final Color txtColor;
  final Color txtColorSecondary;
  final MainAxisAlignment alignment;
  const AppbarContent({
    required this.txtColor,
    required this.txtColorSecondary,
    required this.alignment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: alignment,
          children: [
            Text(
              "FABRIC CLASSIFICATION",
              style: TextStyle(
                color: txtColor,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: alignment,
          children: [
            Text(
              "C",
              style: TextStyle(
                color: txtColorSecondary,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(width: 9),
            Text(
              "HATBOT",
              style: TextStyle(
                color: txtColorSecondary,
                letterSpacing: 18,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
