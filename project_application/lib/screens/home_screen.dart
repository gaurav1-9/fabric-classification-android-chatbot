import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/msgarea.dart';
import '../widgets/userinput_field.dart';
import '../global_properties/app_colors.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List msg = [
    {
      'individual': 'bot',
      'text': "Hello there...\nHow can I help you?",
    },
  ];
  final TextEditingController userInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double msgHeight = (MediaQuery.of(context).size.height -
        (AppBar().preferredSize.height + 114) -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      backgroundColor: AppColor.jet,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColor.mindaro,
        title: const AppbarContent(
          txtColor: AppColor.textColor,
          txtColorSecondary: AppColor.raisinBlack,
          alignment: MainAxisAlignment.start,
        ),
        elevation: 5,
        shadowColor: AppColor.mindaro,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            MsgArea(
              msgHeight: msgHeight,
              msg: msg,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  UserInput(
                    textController: userInput,
                    changeFunction: (value) {
                      setState(() {
                        userInput.text;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
