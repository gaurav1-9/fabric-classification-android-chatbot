import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global_properties/app_colors.dart';

class UserInput extends StatelessWidget {
  final TextEditingController textController;
  final ValueChanged changeFunction;
  const UserInput({
    required this.textController,
    required this.changeFunction,
    super.key,
  });

  void getText(BuildContext ctx) {
    if (textController.text.isNotEmpty) {
      print("Input Value: ${textController.text}");
      FocusScope.of(ctx).unfocus();
      textController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            CupertinoIcons.arrow_up_square_fill,
            color: (textController.text.isNotEmpty)
                ? AppColor.mindaro
                : AppColor.grey,
            size: 32,
          ),
          onPressed: () => getText(context),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        hintText: "Enter text here...",
        hintStyle: const TextStyle(
          color: AppColor.grey,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.mindaro,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      style: const TextStyle(
        color: AppColor.textColor,
        fontSize: 20,
      ),
      cursorColor: AppColor.textColor,
      onChanged: changeFunction,
    );
  }
}
