import 'package:flutter/material.dart';

import '../global_properties/app_colors.dart';

class MsgArea extends StatelessWidget {
  final double msgHeight;
  final List msg;
  const MsgArea({required this.msgHeight, required this.msg, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: msgHeight,
      child: ListView.builder(
        itemCount: msg.length,
        itemBuilder: (ctx, index) {
          return ListTile(
              title: Row(
            mainAxisAlignment: (msg[index]['individual'] == 'bot')
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: BoxDecoration(
                    color: (msg[index]['individual'] == 'bot')
                        ? AppColor.mindaro
                        : AppColor.raisinBlack,
                    borderRadius: (msg[index]['individual'] == 'bot')
                        ? const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )
                        : const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                child: Text(
                  msg[index]['text']!,
                  style: TextStyle(
                    color: (msg[index]['individual'] == 'bot')
                        ? AppColor.jet
                        : AppColor.mindaro,
                  ),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
