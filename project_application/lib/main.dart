import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './global_properties/app_colors.dart';
import './screens/home_screen.dart';

void main() {
  runApp(
    const AndroidChatbot(),
  );
}

class AndroidChatbot extends StatelessWidget {
  const AndroidChatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColor.raisinBlack,
          selectionHandleColor: AppColor.raisinBlack,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
