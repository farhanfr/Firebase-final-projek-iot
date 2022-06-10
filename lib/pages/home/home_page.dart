// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_firebase_iot/pages/home/components/body.dart';
import 'package:test_firebase_iot/constants/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.username = ""}) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBgColor,
      appBar: buildAppBar(),
      body: Body(username: username,),
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
