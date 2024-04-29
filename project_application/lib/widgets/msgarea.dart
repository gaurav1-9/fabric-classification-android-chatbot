import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../global_properties/app_colors.dart';

class MsgArea extends StatefulWidget {
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
  State<MsgArea> createState() => _MsgAreaState();
}

class _MsgAreaState extends State<MsgArea> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.msgHeight,
      child: ListView.builder(
        itemCount: widget.msg.length,
        itemBuilder: (ctx, index) {
          return ListTile(
              title: Row(
            mainAxisAlignment: (widget.msg[index]['individual'] == 'bot')
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: BoxDecoration(
                  color: (widget.msg[index]['individual'] == 'bot')
                      ? AppColor.mindaro
                      : AppColor.jet,
                  borderRadius: (widget.msg[index]['individual'] == 'bot')
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
                child: (widget.msg[index]['img'] == null)
                    ? (widget.msg[index]['type'] == null ||
                            widget.msg[index]['type'] == 'detailedViewer')
                        ? (widget.msg[index]['text'].runtimeType == String)
                            ? (widget.msg[index]['type'] != 'detailedViewer')
                                ? Text(
                                    widget.msg[index]['text']!,
                                    style: TextStyle(
                                      color: (widget.msg[index]['individual'] ==
                                              'bot')
                                          ? AppColor.jet
                                          : AppColor.mindaro,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .83,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "This is a ${widget.msg[index]['text']!} fabric",
                                          style: TextStyle(
                                            color: (widget.msg[index]
                                                        ['individual'] ==
                                                    'bot')
                                                ? AppColor.jet
                                                : AppColor.mindaro,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            String temp;

                                            setState(() {
                                              temp = widget.msg[index]['text'];
                                              widget.msg[index]['text'] = widget
                                                  .msg[index]['detailedText'];
                                              widget.msg[index]
                                                  ['detailedText'] = temp;
                                            });
                                          },
                                          icon: const Icon(
                                              LucideIcons.arrowDownCircle),
                                        ),
                                      ],
                                    ),
                                  )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .83,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "This is a ${widget.msg[index]['detailedText']} fabric",
                                          style: TextStyle(
                                            color: (widget.msg[index]
                                                        ['individual'] ==
                                                    'bot')
                                                ? AppColor.jet
                                                : AppColor.mindaro,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            String temp;

                                            setState(() {
                                              temp = widget.msg[index]
                                                  ['detailedText'];
                                              widget.msg[index]
                                                      ['detailedText'] =
                                                  widget.msg[index]['text'];
                                              widget.msg[index]['text'] = temp;
                                            });
                                          },
                                          icon: const Icon(
                                              LucideIcons.arrowUpCircle),
                                        ),
                                      ],
                                    ),
                                  ),
                                  widget.msg[index]['text']
                                ],
                              )
                        : (widget.imgLoading == true)
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
                        widget.msg[index]['img'],
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
