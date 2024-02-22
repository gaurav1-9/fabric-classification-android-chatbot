import 'package:flutter/material.dart';
import 'package:project_application/widgets/msgarea.dart';

import '../global_properties/app_colors.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _msgController = TextEditingController();
  List msg = [
    {
      'individual': 'user',
      'text': "Hi from user1",
    },
    {
      'individual': 'bot',
      'text': "Hi from bot1",
    },
    {
      'individual': 'user',
      'text': "Hi from user2",
    },
    {
      'individual': 'bot',
      'text': "Hi from bot2",
    },
    {
      'individual': 'user',
      'text': "Hi from user3",
    },
    {
      'individual': 'bot',
      'text': "Hi from bot3",
    },
    {
      'individual': 'user',
      'text': "Hi from user",
    },
    {
      'individual': 'bot',
      'text': "Hi from bot",
    },
    {
      'individual': 'user',
      'text': "Hi from user",
    },
    {
      'individual': 'bot',
      'text': "Hi from bot",
    },
    {
      'individual': 'user',
      'text': "Hi from user",
    },
    {
      'individual': 'bot',
      'text': "Hi from bot",
    },
    {
      'individual': 'user',
      'text': "Hi from user",
    },
    {
      'individual': 'bot',
      'text': "Hi from bot",
    },
    {
      'individual': 'user',
      'text': "Hi from user",
    },
    {
      'individual': 'bot',
      'text': "Hi from bot",
    },
    {
      'individual': 'user',
      'text': "Hi from user",
    },
    {
      'individual': 'bot',
      'text': "Hi from bot",
    },
  ];
  @override
  Widget build(BuildContext context) {
    print(AppBar().preferredSize.height + 34);
    print(MediaQuery.of(context).padding.top);
    double msgHeight = (MediaQuery.of(context).size.height -
        (AppBar().preferredSize.height + 34) -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      backgroundColor: AppColor.jet,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColor.mindaro,
        title: const AppbarContent(AppColor.textColor, AppColor.raisinBlack),
        elevation: 5,
        shadowColor: AppColor.mindaro,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          MsgArea(
            msgHeight: msgHeight,
            msg: msg,
          )
        ],
      ),
    );
  }
}
