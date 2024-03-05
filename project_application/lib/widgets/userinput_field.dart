import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lucide_icons/lucide_icons.dart';

import '../global_properties/app_colors.dart';

class UserInput extends StatelessWidget {
  final TextEditingController textController;
  final ValueChanged changeFunction;
  final Function msgAppender;
  final Function msgPoper;
  final Function errFunction;
  const UserInput({
    required this.errFunction,
    required this.textController,
    required this.changeFunction,
    required this.msgAppender,
    required this.msgPoper,
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
    final url =
        'http://192.168.43.246:65432/chat?text_value=$txt'; //Change the IP
    Map loadingBotResponse = {
      'individual': 'bot',
      'text': 'Thinking...',
    };
    msgAppender(loadingBotResponse);
    print("Before RESPONSE\n$url");

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 3));
      Map responseBody = jsonDecode(response.body);
      print("RESPONSE: ${responseBody['bot_response']}");
      Map botResponse = {
        'individual': 'bot',
        'text': responseBody['bot_response'],
      };
      msgPoper(false);
      msgAppender(botResponse);
    } catch (e) {
      msgPoper(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          controller: textController,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 90, 0),
            hintText: "Enter text here...",
            hintStyle: TextStyle(
              color: AppColor.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
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
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(
                LucideIcons.imagePlus,
                color: AppColor.grey,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.arrow_up_square_fill,
                color: (textController.text.isNotEmpty)
                    ? AppColor.mindaro
                    : AppColor.grey,
                size: 32,
              ),
              onPressed: () => getText(context),
            ),
          ],
        ),
      ],
    );
  }
}
