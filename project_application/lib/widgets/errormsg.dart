import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../global_properties/app_colors.dart';

class ErrorMsg extends StatelessWidget {
  final bool errorMsg;
  const ErrorMsg({
    this.errorMsg = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (errorMsg)
            ? const Row(
                children: [
                  Icon(
                    LucideIcons.serverOff,
                    size: 16,
                    color: AppColor.tomato,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Server busy...",
                    style: TextStyle(
                      color: AppColor.tomato,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : const Text(""),
      ],
    );
  }
}
