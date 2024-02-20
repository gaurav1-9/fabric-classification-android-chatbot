import 'package:flutter/material.dart';

import '../global_properties/app_colors.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.jet,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColor.mindaro,
        title: const AppbarContent(AppColor.textColor, AppColor.raisinBlack),
        elevation: 5,
        shadowColor: AppColor.mindaro,
      ),
    );
  }
}
