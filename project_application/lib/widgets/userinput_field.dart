import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global_properties/app_colors.dart';

class UserInput extends StatelessWidget {
  final TextEditingController textController;
  final ValueChanged changeFunction;
  final Function msgAppender;
  final Function errFunction;
  const UserInput({
    required this.errFunction,
    required this.textController,
    required this.changeFunction,
    required this.msgAppender,
    super.key,
  });

  void getText(BuildContext ctx) {
    if (textController.text.isNotEmpty) {
      Map msgValue = {
        'individual': 'user',
        'text': textController.text,
      };
      msgAppender(msgValue);
      FocusScope.of(ctx).unfocus();
      botResponse(textController.text);
      textController.text = '';
    }
  }

  Future<void> botResponse(String txt) async {
    final url = 'http://127.0.0.1:5000/chat?text_value=$txt';
    try {
      final response = await http.get(Uri.parse(url));
      print("RESPONSE: ${jsonDecode(response.body)}");
    } catch (e) {
      errFunction(true);
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
