import 'package:flutter/material.dart';
import 'package:project_application/widgets/errormsg.dart';

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
  final TextEditingController userInput = TextEditingController();
  bool errMsg = false;

  List msg = [
    {
      'individual': 'bot',
      'text': "Hello there...\nHow can I help you?",
    },
  ];

  void appendChats(Map chatMsg) {
    setState(() {
      msg.add(chatMsg);
    });
  }

  void updateErrMsg(bool err) {
    setState(() {
      errMsg = err;
    });
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        errMsg = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Error msg: $errMsg");
    double msgHeight = (MediaQuery.of(context).size.height -
        (AppBar().preferredSize.height + 117) -
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
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const SizedBox(
            height: 5,
          ),
          MsgArea(
            msgHeight: msgHeight,
            msg: msg,
          ),
          ErrorMsg(
            errorMsg: errMsg,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                UserInput(
                  errFunction: updateErrMsg,
                  textController: userInput,
                  changeFunction: (value) {
                    setState(
                      () {
                        userInput.text;
                      },
                    );
                  },
                  msgAppender: appendChats,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
