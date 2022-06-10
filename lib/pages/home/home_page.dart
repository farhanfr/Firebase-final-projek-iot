// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_firebase_iot/pages/home/components/body.dart';
import 'package:test_firebase_iot/constants/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBgColor,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: purpleColor,
      elevation: 0,
      // leading: IconButton(
      //   icon: SvgPicture.asset("assets/icons/menu.svg"),
      //   onPressed: () {},
      // ),
    );
  }
}
