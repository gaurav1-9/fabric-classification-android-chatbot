import 'dart:io';

import 'package:flutter/material.dart';

import '../global_properties/app_colors.dart';

class MsgArea extends StatelessWidget {
  final double msgHeight;
  final List msg;
  final File? image;
  final bool imgLoading;
  const MsgArea({
    required this.msgHeight,
    required this.msg,
    required this.imgLoading,
    super.key,
    this.image,
  });

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
                      : AppColor.jet,
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
                        ),
                ),
                child: (msg[index]['img'] == null)
                    ? (msg[index]['type'] == null)
                        ? Text(
                            msg[index]['text']!,
                            style: TextStyle(
                              color: (msg[index]['individual'] == 'bot')
                                  ? AppColor.jet
                                  : AppColor.mindaro,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : (imgLoading == true)
                            ? const Row(
                                children: [
                                  Text(
                                    "Processing",
                                    style: TextStyle(
                                      color: AppColor.raisinBlack,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    height: 12,
                                    width: 12,
                                    child: CircularProgressIndicator(
                                      color: AppColor.raisinBlack,
                                      strokeWidth: 1,
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              )
                    : Image.file(
                        msg[index]['img'],
                        scale: 15,
                      ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
