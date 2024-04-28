import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_application/widgets/errormsg.dart';
import 'package:http/http.dart' as http;

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
  bool imgLoading = false;

  List msg = [
    {
      'individual': 'bot',
      'text': "Hello there...\nHow can I help you?",
    },
  ];

  File? _image;

  Future<void> _getImageFromGallery() async {
    setState(() {
      _image = null;
    });

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        msg.add({
          'individual': 'user_img',
          'img': _image,
        });
      }
      _uploadImage();
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    setState(() {
      imgLoading = true;
    });
    Map imgLoadingBotResponse = {
      'individual': 'bot',
      'type': 'imgResponse',
    };
    appendChats(imgLoadingBotResponse);

    const url = 'http://192.168.43.246:65432/image';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    var imageStream = http.ByteStream(_image!.openRead());
    var length = await _image!.length();
    var multipartFile = http.MultipartFile('image', imageStream, length,
        filename: _image!.path.split('/').last);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      print(jsonResponse);
      popTempChat(false);
      Map botImgResponse = {
        'individual': 'bot',
        'text':
            "CNN Result:\n${jsonResponse['bot_response_CNN']}\n\nResNet50 Result:\n${jsonResponse['bot_response_resNet']}\n(${jsonResponse['acc_resNet']}%)",
      };
      appendChats(botImgResponse);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          imgLoading = false;
        });
      });
    } else {
      popTempChat(true);
    }
  }

  void appendChats(Map chatMsg) {
    setState(() {
      msg.add(chatMsg);
    });
  }

  void popTempChat(bool hasCatchError) {
    if (hasCatchError) {
      setState(() {
        msg.last['text'] =
            'Thinking...\nTaking longer than usual\nPlease wait...';
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          msg.removeLast();
        });
      });
      Future.delayed(const Duration(seconds: 3), () {
        updateErrMsg(true);
      });
    } else {
      setState(() {
        msg.removeLast();
      });
    }
  }

  void updateErrMsg(bool err) {
    setState(
      () {
        errMsg = err;
      },
    );
    Future.delayed(
      const Duration(seconds: 5),
      () {
        setState(
          () {
            errMsg = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double msgHeight = (MediaQuery.of(context).size.height -
        (AppBar().preferredSize.height + 123) -
        MediaQuery.of(context).padding.top);

    return Scaffold(
      backgroundColor: AppColor.raisinBlack,
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                const SizedBox(
                  height: 5,
                ),
                MsgArea(
                  msgHeight: msgHeight,
                  msg: msg,
                  image: _image,
                  imgLoading: imgLoading,
                ),
                ErrorMsg(
                  errorMsg: errMsg,
                ),
              ],
            ),
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
                  msgPoper: popTempChat,
                  imgPicker: () => _getImageFromGallery(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
