import 'package:flutter/material.dart';

class AppbarContent extends StatelessWidget {
  final Color txtColor;
  final Color txtColorSecondary;
  const AppbarContent(this.txtColor, this.txtColorSecondary, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
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
